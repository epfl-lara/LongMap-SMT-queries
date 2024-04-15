; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95122 () Bool)

(assert start!95122)

(declare-fun b_free!22207 () Bool)

(declare-fun b_next!22207 () Bool)

(assert (=> start!95122 (= b_free!22207 (not b_next!22207))))

(declare-fun tp!78107 () Bool)

(declare-fun b_and!35111 () Bool)

(assert (=> start!95122 (= tp!78107 b_and!35111)))

(declare-fun b!1075189 () Bool)

(declare-fun e!614467 () Bool)

(declare-fun tp_is_empty!26017 () Bool)

(assert (=> b!1075189 (= e!614467 tp_is_empty!26017)))

(declare-fun mapIsEmpty!40759 () Bool)

(declare-fun mapRes!40759 () Bool)

(assert (=> mapIsEmpty!40759 mapRes!40759))

(declare-fun b!1075190 () Bool)

(declare-fun e!614468 () Bool)

(declare-fun e!614472 () Bool)

(assert (=> b!1075190 (= e!614468 (and e!614472 mapRes!40759))))

(declare-fun condMapEmpty!40759 () Bool)

(declare-datatypes ((V!39825 0))(
  ( (V!39826 (val!13059 Int)) )
))
(declare-datatypes ((ValueCell!12305 0))(
  ( (ValueCellFull!12305 (v!15682 V!39825)) (EmptyCell!12305) )
))
(declare-datatypes ((array!68936 0))(
  ( (array!68937 (arr!33155 (Array (_ BitVec 32) ValueCell!12305)) (size!33693 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68936)

(declare-fun mapDefault!40759 () ValueCell!12305)

(assert (=> b!1075190 (= condMapEmpty!40759 (= (arr!33155 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12305)) mapDefault!40759)))))

(declare-fun b!1075191 () Bool)

(assert (=> b!1075191 (= e!614472 tp_is_empty!26017)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun b!1075193 () Bool)

(declare-fun e!614469 () Bool)

(declare-datatypes ((tuple2!16702 0))(
  ( (tuple2!16703 (_1!8362 (_ BitVec 64)) (_2!8362 V!39825)) )
))
(declare-datatypes ((List!23223 0))(
  ( (Nil!23220) (Cons!23219 (h!24428 tuple2!16702) (t!32565 List!23223)) )
))
(declare-datatypes ((ListLongMap!14671 0))(
  ( (ListLongMap!14672 (toList!7351 List!23223)) )
))
(declare-fun lt!477109 () ListLongMap!14671)

(declare-fun minValue!907 () V!39825)

(declare-datatypes ((array!68938 0))(
  ( (array!68939 (arr!33156 (Array (_ BitVec 32) (_ BitVec 64))) (size!33694 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68938)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39825)

(declare-fun getCurrentListMap!4119 (array!68938 array!68936 (_ BitVec 32) (_ BitVec 32) V!39825 V!39825 (_ BitVec 32) Int) ListLongMap!14671)

(assert (=> b!1075193 (= e!614469 (= lt!477109 (getCurrentListMap!4119 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)))))

(declare-fun lt!477107 () ListLongMap!14671)

(assert (=> b!1075193 (= lt!477109 lt!477107)))

(declare-fun -!695 (ListLongMap!14671 (_ BitVec 64)) ListLongMap!14671)

(assert (=> b!1075193 (= lt!477109 (-!695 lt!477107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!35247 0))(
  ( (Unit!35248) )
))
(declare-fun lt!477112 () Unit!35247)

(declare-fun removeNotPresentStillSame!73 (ListLongMap!14671 (_ BitVec 64)) Unit!35247)

(assert (=> b!1075193 (= lt!477112 (removeNotPresentStillSame!73 lt!477107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075194 () Bool)

(declare-fun res!716821 () Bool)

(declare-fun e!614471 () Bool)

(assert (=> b!1075194 (=> (not res!716821) (not e!614471))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1075194 (= res!716821 (and (= (size!33693 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33694 _keys!1163) (size!33693 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075195 () Bool)

(declare-fun res!716818 () Bool)

(assert (=> b!1075195 (=> (not res!716818) (not e!614471))))

(declare-datatypes ((List!23224 0))(
  ( (Nil!23221) (Cons!23220 (h!24429 (_ BitVec 64)) (t!32566 List!23224)) )
))
(declare-fun arrayNoDuplicates!0 (array!68938 (_ BitVec 32) List!23224) Bool)

(assert (=> b!1075195 (= res!716818 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23221))))

(declare-fun b!1075196 () Bool)

(declare-fun e!614473 () Bool)

(assert (=> b!1075196 (= e!614471 (not e!614473))))

(declare-fun res!716820 () Bool)

(assert (=> b!1075196 (=> res!716820 e!614473)))

(assert (=> b!1075196 (= res!716820 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!477108 () ListLongMap!14671)

(declare-fun lt!477110 () ListLongMap!14671)

(assert (=> b!1075196 (= lt!477108 lt!477110)))

(declare-fun zeroValueBefore!47 () V!39825)

(declare-fun lt!477111 () Unit!35247)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!901 (array!68938 array!68936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39825 V!39825 V!39825 V!39825 (_ BitVec 32) Int) Unit!35247)

(assert (=> b!1075196 (= lt!477111 (lemmaNoChangeToArrayThenSameMapNoExtras!901 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3929 (array!68938 array!68936 (_ BitVec 32) (_ BitVec 32) V!39825 V!39825 (_ BitVec 32) Int) ListLongMap!14671)

(assert (=> b!1075196 (= lt!477110 (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075196 (= lt!477108 (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!716817 () Bool)

(assert (=> start!95122 (=> (not res!716817) (not e!614471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95122 (= res!716817 (validMask!0 mask!1515))))

(assert (=> start!95122 e!614471))

(assert (=> start!95122 true))

(assert (=> start!95122 tp_is_empty!26017))

(declare-fun array_inv!25650 (array!68936) Bool)

(assert (=> start!95122 (and (array_inv!25650 _values!955) e!614468)))

(assert (=> start!95122 tp!78107))

(declare-fun array_inv!25651 (array!68938) Bool)

(assert (=> start!95122 (array_inv!25651 _keys!1163)))

(declare-fun b!1075192 () Bool)

(declare-fun res!716819 () Bool)

(assert (=> b!1075192 (=> (not res!716819) (not e!614471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68938 (_ BitVec 32)) Bool)

(assert (=> b!1075192 (= res!716819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40759 () Bool)

(declare-fun tp!78106 () Bool)

(assert (=> mapNonEmpty!40759 (= mapRes!40759 (and tp!78106 e!614467))))

(declare-fun mapKey!40759 () (_ BitVec 32))

(declare-fun mapValue!40759 () ValueCell!12305)

(declare-fun mapRest!40759 () (Array (_ BitVec 32) ValueCell!12305))

(assert (=> mapNonEmpty!40759 (= (arr!33155 _values!955) (store mapRest!40759 mapKey!40759 mapValue!40759))))

(declare-fun b!1075197 () Bool)

(assert (=> b!1075197 (= e!614473 e!614469)))

(declare-fun res!716822 () Bool)

(assert (=> b!1075197 (=> res!716822 e!614469)))

(declare-fun contains!6316 (ListLongMap!14671 (_ BitVec 64)) Bool)

(assert (=> b!1075197 (= res!716822 (contains!6316 lt!477107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1075197 (= lt!477107 (getCurrentListMap!4119 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!95122 res!716817) b!1075194))

(assert (= (and b!1075194 res!716821) b!1075192))

(assert (= (and b!1075192 res!716819) b!1075195))

(assert (= (and b!1075195 res!716818) b!1075196))

(assert (= (and b!1075196 (not res!716820)) b!1075197))

(assert (= (and b!1075197 (not res!716822)) b!1075193))

(assert (= (and b!1075190 condMapEmpty!40759) mapIsEmpty!40759))

(assert (= (and b!1075190 (not condMapEmpty!40759)) mapNonEmpty!40759))

(get-info :version)

(assert (= (and mapNonEmpty!40759 ((_ is ValueCellFull!12305) mapValue!40759)) b!1075189))

(assert (= (and b!1075190 ((_ is ValueCellFull!12305) mapDefault!40759)) b!1075191))

(assert (= start!95122 b!1075190))

(declare-fun m!993545 () Bool)

(assert (=> b!1075192 m!993545))

(declare-fun m!993547 () Bool)

(assert (=> b!1075195 m!993547))

(declare-fun m!993549 () Bool)

(assert (=> b!1075193 m!993549))

(declare-fun m!993551 () Bool)

(assert (=> b!1075193 m!993551))

(declare-fun m!993553 () Bool)

(assert (=> b!1075193 m!993553))

(declare-fun m!993555 () Bool)

(assert (=> start!95122 m!993555))

(declare-fun m!993557 () Bool)

(assert (=> start!95122 m!993557))

(declare-fun m!993559 () Bool)

(assert (=> start!95122 m!993559))

(declare-fun m!993561 () Bool)

(assert (=> b!1075197 m!993561))

(declare-fun m!993563 () Bool)

(assert (=> b!1075197 m!993563))

(declare-fun m!993565 () Bool)

(assert (=> mapNonEmpty!40759 m!993565))

(declare-fun m!993567 () Bool)

(assert (=> b!1075196 m!993567))

(declare-fun m!993569 () Bool)

(assert (=> b!1075196 m!993569))

(declare-fun m!993571 () Bool)

(assert (=> b!1075196 m!993571))

(check-sat tp_is_empty!26017 b_and!35111 (not b_next!22207) (not b!1075192) (not b!1075197) (not b!1075193) (not start!95122) (not b!1075195) (not b!1075196) (not mapNonEmpty!40759))
(check-sat b_and!35111 (not b_next!22207))
(get-model)

(declare-fun d!129433 () Bool)

(declare-fun e!614521 () Bool)

(assert (=> d!129433 e!614521))

(declare-fun res!716861 () Bool)

(assert (=> d!129433 (=> res!716861 e!614521)))

(declare-fun lt!477160 () Bool)

(assert (=> d!129433 (= res!716861 (not lt!477160))))

(declare-fun lt!477159 () Bool)

(assert (=> d!129433 (= lt!477160 lt!477159)))

(declare-fun lt!477157 () Unit!35247)

(declare-fun e!614520 () Unit!35247)

(assert (=> d!129433 (= lt!477157 e!614520)))

(declare-fun c!108003 () Bool)

(assert (=> d!129433 (= c!108003 lt!477159)))

(declare-fun containsKey!580 (List!23223 (_ BitVec 64)) Bool)

(assert (=> d!129433 (= lt!477159 (containsKey!580 (toList!7351 lt!477107) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129433 (= (contains!6316 lt!477107 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477160)))

(declare-fun b!1075258 () Bool)

(declare-fun lt!477158 () Unit!35247)

(assert (=> b!1075258 (= e!614520 lt!477158)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!412 (List!23223 (_ BitVec 64)) Unit!35247)

(assert (=> b!1075258 (= lt!477158 (lemmaContainsKeyImpliesGetValueByKeyDefined!412 (toList!7351 lt!477107) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!664 0))(
  ( (Some!663 (v!15685 V!39825)) (None!662) )
))
(declare-fun isDefined!455 (Option!664) Bool)

(declare-fun getValueByKey!613 (List!23223 (_ BitVec 64)) Option!664)

(assert (=> b!1075258 (isDefined!455 (getValueByKey!613 (toList!7351 lt!477107) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075259 () Bool)

(declare-fun Unit!35251 () Unit!35247)

(assert (=> b!1075259 (= e!614520 Unit!35251)))

(declare-fun b!1075260 () Bool)

(assert (=> b!1075260 (= e!614521 (isDefined!455 (getValueByKey!613 (toList!7351 lt!477107) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129433 c!108003) b!1075258))

(assert (= (and d!129433 (not c!108003)) b!1075259))

(assert (= (and d!129433 (not res!716861)) b!1075260))

(declare-fun m!993629 () Bool)

(assert (=> d!129433 m!993629))

(declare-fun m!993631 () Bool)

(assert (=> b!1075258 m!993631))

(declare-fun m!993633 () Bool)

(assert (=> b!1075258 m!993633))

(assert (=> b!1075258 m!993633))

(declare-fun m!993635 () Bool)

(assert (=> b!1075258 m!993635))

(assert (=> b!1075260 m!993633))

(assert (=> b!1075260 m!993633))

(assert (=> b!1075260 m!993635))

(assert (=> b!1075197 d!129433))

(declare-fun bm!45490 () Bool)

(declare-fun call!45493 () ListLongMap!14671)

(declare-fun call!45499 () ListLongMap!14671)

(assert (=> bm!45490 (= call!45493 call!45499)))

(declare-fun b!1075303 () Bool)

(declare-fun e!614549 () Bool)

(declare-fun lt!477217 () ListLongMap!14671)

(declare-fun apply!932 (ListLongMap!14671 (_ BitVec 64)) V!39825)

(assert (=> b!1075303 (= e!614549 (= (apply!932 lt!477217 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1075304 () Bool)

(declare-fun e!614555 () Bool)

(declare-fun call!45494 () Bool)

(assert (=> b!1075304 (= e!614555 (not call!45494))))

(declare-fun bm!45491 () Bool)

(declare-fun call!45496 () ListLongMap!14671)

(declare-fun call!45495 () ListLongMap!14671)

(assert (=> bm!45491 (= call!45496 call!45495)))

(declare-fun b!1075305 () Bool)

(declare-fun e!614560 () Bool)

(declare-fun get!17232 (ValueCell!12305 V!39825) V!39825)

(declare-fun dynLambda!2031 (Int (_ BitVec 64)) V!39825)

(assert (=> b!1075305 (= e!614560 (= (apply!932 lt!477217 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)) (get!17232 (select (arr!33155 _values!955) #b00000000000000000000000000000000) (dynLambda!2031 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33693 _values!955)))))

(assert (=> b!1075305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(declare-fun b!1075306 () Bool)

(declare-fun e!614556 () Bool)

(assert (=> b!1075306 (= e!614556 e!614560)))

(declare-fun res!716884 () Bool)

(assert (=> b!1075306 (=> (not res!716884) (not e!614560))))

(assert (=> b!1075306 (= res!716884 (contains!6316 lt!477217 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075306 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(declare-fun bm!45492 () Bool)

(declare-fun call!45497 () ListLongMap!14671)

(assert (=> bm!45492 (= call!45497 call!45493)))

(declare-fun b!1075307 () Bool)

(declare-fun e!614550 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1075307 (= e!614550 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075308 () Bool)

(declare-fun res!716882 () Bool)

(declare-fun e!614558 () Bool)

(assert (=> b!1075308 (=> (not res!716882) (not e!614558))))

(assert (=> b!1075308 (= res!716882 e!614556)))

(declare-fun res!716885 () Bool)

(assert (=> b!1075308 (=> res!716885 e!614556)))

(assert (=> b!1075308 (= res!716885 (not e!614550))))

(declare-fun res!716887 () Bool)

(assert (=> b!1075308 (=> (not res!716887) (not e!614550))))

(assert (=> b!1075308 (= res!716887 (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(declare-fun bm!45493 () Bool)

(assert (=> bm!45493 (= call!45494 (contains!6316 lt!477217 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075309 () Bool)

(declare-fun e!614559 () ListLongMap!14671)

(assert (=> b!1075309 (= e!614559 call!45496)))

(declare-fun b!1075310 () Bool)

(declare-fun e!614552 () Bool)

(assert (=> b!1075310 (= e!614555 e!614552)))

(declare-fun res!716880 () Bool)

(assert (=> b!1075310 (= res!716880 call!45494)))

(assert (=> b!1075310 (=> (not res!716880) (not e!614552))))

(declare-fun b!1075311 () Bool)

(assert (=> b!1075311 (= e!614558 e!614555)))

(declare-fun c!108017 () Bool)

(assert (=> b!1075311 (= c!108017 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075312 () Bool)

(declare-fun res!716881 () Bool)

(assert (=> b!1075312 (=> (not res!716881) (not e!614558))))

(declare-fun e!614557 () Bool)

(assert (=> b!1075312 (= res!716881 e!614557)))

(declare-fun c!108018 () Bool)

(assert (=> b!1075312 (= c!108018 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075313 () Bool)

(declare-fun call!45498 () Bool)

(assert (=> b!1075313 (= e!614557 (not call!45498))))

(declare-fun b!1075314 () Bool)

(declare-fun e!614548 () Unit!35247)

(declare-fun lt!477216 () Unit!35247)

(assert (=> b!1075314 (= e!614548 lt!477216)))

(declare-fun lt!477212 () ListLongMap!14671)

(assert (=> b!1075314 (= lt!477212 (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477213 () (_ BitVec 64))

(assert (=> b!1075314 (= lt!477213 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477209 () (_ BitVec 64))

(assert (=> b!1075314 (= lt!477209 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477210 () Unit!35247)

(declare-fun addStillContains!645 (ListLongMap!14671 (_ BitVec 64) V!39825 (_ BitVec 64)) Unit!35247)

(assert (=> b!1075314 (= lt!477210 (addStillContains!645 lt!477212 lt!477213 zeroValueBefore!47 lt!477209))))

(declare-fun +!3251 (ListLongMap!14671 tuple2!16702) ListLongMap!14671)

(assert (=> b!1075314 (contains!6316 (+!3251 lt!477212 (tuple2!16703 lt!477213 zeroValueBefore!47)) lt!477209)))

(declare-fun lt!477208 () Unit!35247)

(assert (=> b!1075314 (= lt!477208 lt!477210)))

(declare-fun lt!477219 () ListLongMap!14671)

(assert (=> b!1075314 (= lt!477219 (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477206 () (_ BitVec 64))

(assert (=> b!1075314 (= lt!477206 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477222 () (_ BitVec 64))

(assert (=> b!1075314 (= lt!477222 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477214 () Unit!35247)

(declare-fun addApplyDifferent!501 (ListLongMap!14671 (_ BitVec 64) V!39825 (_ BitVec 64)) Unit!35247)

(assert (=> b!1075314 (= lt!477214 (addApplyDifferent!501 lt!477219 lt!477206 minValue!907 lt!477222))))

(assert (=> b!1075314 (= (apply!932 (+!3251 lt!477219 (tuple2!16703 lt!477206 minValue!907)) lt!477222) (apply!932 lt!477219 lt!477222))))

(declare-fun lt!477226 () Unit!35247)

(assert (=> b!1075314 (= lt!477226 lt!477214)))

(declare-fun lt!477223 () ListLongMap!14671)

(assert (=> b!1075314 (= lt!477223 (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477225 () (_ BitVec 64))

(assert (=> b!1075314 (= lt!477225 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477215 () (_ BitVec 64))

(assert (=> b!1075314 (= lt!477215 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477224 () Unit!35247)

(assert (=> b!1075314 (= lt!477224 (addApplyDifferent!501 lt!477223 lt!477225 zeroValueBefore!47 lt!477215))))

(assert (=> b!1075314 (= (apply!932 (+!3251 lt!477223 (tuple2!16703 lt!477225 zeroValueBefore!47)) lt!477215) (apply!932 lt!477223 lt!477215))))

(declare-fun lt!477221 () Unit!35247)

(assert (=> b!1075314 (= lt!477221 lt!477224)))

(declare-fun lt!477220 () ListLongMap!14671)

(assert (=> b!1075314 (= lt!477220 (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477205 () (_ BitVec 64))

(assert (=> b!1075314 (= lt!477205 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477211 () (_ BitVec 64))

(assert (=> b!1075314 (= lt!477211 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075314 (= lt!477216 (addApplyDifferent!501 lt!477220 lt!477205 minValue!907 lt!477211))))

(assert (=> b!1075314 (= (apply!932 (+!3251 lt!477220 (tuple2!16703 lt!477205 minValue!907)) lt!477211) (apply!932 lt!477220 lt!477211))))

(declare-fun bm!45494 () Bool)

(declare-fun c!108021 () Bool)

(declare-fun c!108019 () Bool)

(assert (=> bm!45494 (= call!45495 (+!3251 (ite c!108019 call!45499 (ite c!108021 call!45493 call!45497)) (ite (or c!108019 c!108021) (tuple2!16703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075315 () Bool)

(assert (=> b!1075315 (= e!614557 e!614549)))

(declare-fun res!716888 () Bool)

(assert (=> b!1075315 (= res!716888 call!45498)))

(assert (=> b!1075315 (=> (not res!716888) (not e!614549))))

(declare-fun b!1075316 () Bool)

(declare-fun e!614551 () Bool)

(assert (=> b!1075316 (= e!614551 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075317 () Bool)

(declare-fun c!108016 () Bool)

(assert (=> b!1075317 (= c!108016 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!614554 () ListLongMap!14671)

(assert (=> b!1075317 (= e!614559 e!614554)))

(declare-fun b!1075318 () Bool)

(declare-fun e!614553 () ListLongMap!14671)

(assert (=> b!1075318 (= e!614553 (+!3251 call!45495 (tuple2!16703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun d!129435 () Bool)

(assert (=> d!129435 e!614558))

(declare-fun res!716883 () Bool)

(assert (=> d!129435 (=> (not res!716883) (not e!614558))))

(assert (=> d!129435 (= res!716883 (or (bvsge #b00000000000000000000000000000000 (size!33694 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))))

(declare-fun lt!477218 () ListLongMap!14671)

(assert (=> d!129435 (= lt!477217 lt!477218)))

(declare-fun lt!477207 () Unit!35247)

(assert (=> d!129435 (= lt!477207 e!614548)))

(declare-fun c!108020 () Bool)

(assert (=> d!129435 (= c!108020 e!614551)))

(declare-fun res!716886 () Bool)

(assert (=> d!129435 (=> (not res!716886) (not e!614551))))

(assert (=> d!129435 (= res!716886 (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(assert (=> d!129435 (= lt!477218 e!614553)))

(assert (=> d!129435 (= c!108019 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129435 (validMask!0 mask!1515)))

(assert (=> d!129435 (= (getCurrentListMap!4119 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477217)))

(declare-fun b!1075319 () Bool)

(assert (=> b!1075319 (= e!614554 call!45497)))

(declare-fun bm!45495 () Bool)

(assert (=> bm!45495 (= call!45498 (contains!6316 lt!477217 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075320 () Bool)

(declare-fun Unit!35252 () Unit!35247)

(assert (=> b!1075320 (= e!614548 Unit!35252)))

(declare-fun b!1075321 () Bool)

(assert (=> b!1075321 (= e!614553 e!614559)))

(assert (=> b!1075321 (= c!108021 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075322 () Bool)

(assert (=> b!1075322 (= e!614554 call!45496)))

(declare-fun b!1075323 () Bool)

(assert (=> b!1075323 (= e!614552 (= (apply!932 lt!477217 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45496 () Bool)

(assert (=> bm!45496 (= call!45499 (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and d!129435 c!108019) b!1075318))

(assert (= (and d!129435 (not c!108019)) b!1075321))

(assert (= (and b!1075321 c!108021) b!1075309))

(assert (= (and b!1075321 (not c!108021)) b!1075317))

(assert (= (and b!1075317 c!108016) b!1075322))

(assert (= (and b!1075317 (not c!108016)) b!1075319))

(assert (= (or b!1075322 b!1075319) bm!45492))

(assert (= (or b!1075309 bm!45492) bm!45490))

(assert (= (or b!1075309 b!1075322) bm!45491))

(assert (= (or b!1075318 bm!45490) bm!45496))

(assert (= (or b!1075318 bm!45491) bm!45494))

(assert (= (and d!129435 res!716886) b!1075316))

(assert (= (and d!129435 c!108020) b!1075314))

(assert (= (and d!129435 (not c!108020)) b!1075320))

(assert (= (and d!129435 res!716883) b!1075308))

(assert (= (and b!1075308 res!716887) b!1075307))

(assert (= (and b!1075308 (not res!716885)) b!1075306))

(assert (= (and b!1075306 res!716884) b!1075305))

(assert (= (and b!1075308 res!716882) b!1075312))

(assert (= (and b!1075312 c!108018) b!1075315))

(assert (= (and b!1075312 (not c!108018)) b!1075313))

(assert (= (and b!1075315 res!716888) b!1075303))

(assert (= (or b!1075315 b!1075313) bm!45495))

(assert (= (and b!1075312 res!716881) b!1075311))

(assert (= (and b!1075311 c!108017) b!1075310))

(assert (= (and b!1075311 (not c!108017)) b!1075304))

(assert (= (and b!1075310 res!716880) b!1075323))

(assert (= (or b!1075310 b!1075304) bm!45493))

(declare-fun b_lambda!16855 () Bool)

(assert (=> (not b_lambda!16855) (not b!1075305)))

(declare-fun t!32569 () Bool)

(declare-fun tb!7165 () Bool)

(assert (=> (and start!95122 (= defaultEntry!963 defaultEntry!963) t!32569) tb!7165))

(declare-fun result!14819 () Bool)

(assert (=> tb!7165 (= result!14819 tp_is_empty!26017)))

(assert (=> b!1075305 t!32569))

(declare-fun b_and!35117 () Bool)

(assert (= b_and!35111 (and (=> t!32569 result!14819) b_and!35117)))

(declare-fun m!993637 () Bool)

(assert (=> b!1075316 m!993637))

(assert (=> b!1075316 m!993637))

(declare-fun m!993639 () Bool)

(assert (=> b!1075316 m!993639))

(assert (=> b!1075307 m!993637))

(assert (=> b!1075307 m!993637))

(assert (=> b!1075307 m!993639))

(declare-fun m!993641 () Bool)

(assert (=> bm!45495 m!993641))

(declare-fun m!993643 () Bool)

(assert (=> b!1075305 m!993643))

(declare-fun m!993645 () Bool)

(assert (=> b!1075305 m!993645))

(assert (=> b!1075305 m!993637))

(declare-fun m!993647 () Bool)

(assert (=> b!1075305 m!993647))

(assert (=> b!1075305 m!993637))

(assert (=> b!1075305 m!993645))

(assert (=> b!1075305 m!993643))

(declare-fun m!993649 () Bool)

(assert (=> b!1075305 m!993649))

(declare-fun m!993651 () Bool)

(assert (=> b!1075323 m!993651))

(declare-fun m!993653 () Bool)

(assert (=> bm!45494 m!993653))

(assert (=> d!129435 m!993555))

(declare-fun m!993655 () Bool)

(assert (=> b!1075314 m!993655))

(assert (=> b!1075314 m!993655))

(declare-fun m!993657 () Bool)

(assert (=> b!1075314 m!993657))

(declare-fun m!993659 () Bool)

(assert (=> b!1075314 m!993659))

(declare-fun m!993661 () Bool)

(assert (=> b!1075314 m!993661))

(declare-fun m!993663 () Bool)

(assert (=> b!1075314 m!993663))

(declare-fun m!993665 () Bool)

(assert (=> b!1075314 m!993665))

(declare-fun m!993667 () Bool)

(assert (=> b!1075314 m!993667))

(declare-fun m!993669 () Bool)

(assert (=> b!1075314 m!993669))

(declare-fun m!993671 () Bool)

(assert (=> b!1075314 m!993671))

(assert (=> b!1075314 m!993637))

(declare-fun m!993673 () Bool)

(assert (=> b!1075314 m!993673))

(assert (=> b!1075314 m!993667))

(declare-fun m!993675 () Bool)

(assert (=> b!1075314 m!993675))

(declare-fun m!993677 () Bool)

(assert (=> b!1075314 m!993677))

(declare-fun m!993679 () Bool)

(assert (=> b!1075314 m!993679))

(declare-fun m!993681 () Bool)

(assert (=> b!1075314 m!993681))

(assert (=> b!1075314 m!993671))

(declare-fun m!993683 () Bool)

(assert (=> b!1075314 m!993683))

(assert (=> b!1075314 m!993571))

(assert (=> b!1075314 m!993659))

(assert (=> b!1075306 m!993637))

(assert (=> b!1075306 m!993637))

(declare-fun m!993685 () Bool)

(assert (=> b!1075306 m!993685))

(declare-fun m!993687 () Bool)

(assert (=> b!1075303 m!993687))

(declare-fun m!993689 () Bool)

(assert (=> bm!45493 m!993689))

(declare-fun m!993691 () Bool)

(assert (=> b!1075318 m!993691))

(assert (=> bm!45496 m!993571))

(assert (=> b!1075197 d!129435))

(declare-fun d!129437 () Bool)

(declare-fun res!716894 () Bool)

(declare-fun e!614567 () Bool)

(assert (=> d!129437 (=> res!716894 e!614567)))

(assert (=> d!129437 (= res!716894 (bvsge #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(assert (=> d!129437 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!614567)))

(declare-fun b!1075334 () Bool)

(declare-fun e!614569 () Bool)

(declare-fun call!45502 () Bool)

(assert (=> b!1075334 (= e!614569 call!45502)))

(declare-fun b!1075335 () Bool)

(declare-fun e!614568 () Bool)

(assert (=> b!1075335 (= e!614568 call!45502)))

(declare-fun b!1075336 () Bool)

(assert (=> b!1075336 (= e!614569 e!614568)))

(declare-fun lt!477235 () (_ BitVec 64))

(assert (=> b!1075336 (= lt!477235 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477234 () Unit!35247)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68938 (_ BitVec 64) (_ BitVec 32)) Unit!35247)

(assert (=> b!1075336 (= lt!477234 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!477235 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1075336 (arrayContainsKey!0 _keys!1163 lt!477235 #b00000000000000000000000000000000)))

(declare-fun lt!477233 () Unit!35247)

(assert (=> b!1075336 (= lt!477233 lt!477234)))

(declare-fun res!716893 () Bool)

(declare-datatypes ((SeekEntryResult!9891 0))(
  ( (MissingZero!9891 (index!41935 (_ BitVec 32))) (Found!9891 (index!41936 (_ BitVec 32))) (Intermediate!9891 (undefined!10703 Bool) (index!41937 (_ BitVec 32)) (x!96378 (_ BitVec 32))) (Undefined!9891) (MissingVacant!9891 (index!41938 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68938 (_ BitVec 32)) SeekEntryResult!9891)

(assert (=> b!1075336 (= res!716893 (= (seekEntryOrOpen!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9891 #b00000000000000000000000000000000)))))

(assert (=> b!1075336 (=> (not res!716893) (not e!614568))))

(declare-fun bm!45499 () Bool)

(assert (=> bm!45499 (= call!45502 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1075337 () Bool)

(assert (=> b!1075337 (= e!614567 e!614569)))

(declare-fun c!108024 () Bool)

(assert (=> b!1075337 (= c!108024 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129437 (not res!716894)) b!1075337))

(assert (= (and b!1075337 c!108024) b!1075336))

(assert (= (and b!1075337 (not c!108024)) b!1075334))

(assert (= (and b!1075336 res!716893) b!1075335))

(assert (= (or b!1075335 b!1075334) bm!45499))

(assert (=> b!1075336 m!993637))

(declare-fun m!993693 () Bool)

(assert (=> b!1075336 m!993693))

(declare-fun m!993695 () Bool)

(assert (=> b!1075336 m!993695))

(assert (=> b!1075336 m!993637))

(declare-fun m!993697 () Bool)

(assert (=> b!1075336 m!993697))

(declare-fun m!993699 () Bool)

(assert (=> bm!45499 m!993699))

(assert (=> b!1075337 m!993637))

(assert (=> b!1075337 m!993637))

(assert (=> b!1075337 m!993639))

(assert (=> b!1075192 d!129437))

(declare-fun d!129439 () Bool)

(assert (=> d!129439 (= (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477238 () Unit!35247)

(declare-fun choose!1761 (array!68938 array!68936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39825 V!39825 V!39825 V!39825 (_ BitVec 32) Int) Unit!35247)

(assert (=> d!129439 (= lt!477238 (choose!1761 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129439 (validMask!0 mask!1515)))

(assert (=> d!129439 (= (lemmaNoChangeToArrayThenSameMapNoExtras!901 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477238)))

(declare-fun bs!31654 () Bool)

(assert (= bs!31654 d!129439))

(assert (=> bs!31654 m!993571))

(assert (=> bs!31654 m!993569))

(declare-fun m!993701 () Bool)

(assert (=> bs!31654 m!993701))

(assert (=> bs!31654 m!993555))

(assert (=> b!1075196 d!129439))

(declare-fun b!1075362 () Bool)

(declare-fun e!614585 () Bool)

(declare-fun lt!477254 () ListLongMap!14671)

(declare-fun isEmpty!962 (ListLongMap!14671) Bool)

(assert (=> b!1075362 (= e!614585 (isEmpty!962 lt!477254))))

(declare-fun b!1075363 () Bool)

(declare-fun e!614589 () ListLongMap!14671)

(declare-fun call!45505 () ListLongMap!14671)

(assert (=> b!1075363 (= e!614589 call!45505)))

(declare-fun d!129441 () Bool)

(declare-fun e!614586 () Bool)

(assert (=> d!129441 e!614586))

(declare-fun res!716906 () Bool)

(assert (=> d!129441 (=> (not res!716906) (not e!614586))))

(assert (=> d!129441 (= res!716906 (not (contains!6316 lt!477254 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!614587 () ListLongMap!14671)

(assert (=> d!129441 (= lt!477254 e!614587)))

(declare-fun c!108033 () Bool)

(assert (=> d!129441 (= c!108033 (bvsge #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(assert (=> d!129441 (validMask!0 mask!1515)))

(assert (=> d!129441 (= (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477254)))

(declare-fun b!1075364 () Bool)

(declare-fun lt!477256 () Unit!35247)

(declare-fun lt!477255 () Unit!35247)

(assert (=> b!1075364 (= lt!477256 lt!477255)))

(declare-fun lt!477257 () (_ BitVec 64))

(declare-fun lt!477259 () (_ BitVec 64))

(declare-fun lt!477253 () V!39825)

(declare-fun lt!477258 () ListLongMap!14671)

(assert (=> b!1075364 (not (contains!6316 (+!3251 lt!477258 (tuple2!16703 lt!477259 lt!477253)) lt!477257))))

(declare-fun addStillNotContains!268 (ListLongMap!14671 (_ BitVec 64) V!39825 (_ BitVec 64)) Unit!35247)

(assert (=> b!1075364 (= lt!477255 (addStillNotContains!268 lt!477258 lt!477259 lt!477253 lt!477257))))

(assert (=> b!1075364 (= lt!477257 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075364 (= lt!477253 (get!17232 (select (arr!33155 _values!955) #b00000000000000000000000000000000) (dynLambda!2031 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075364 (= lt!477259 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075364 (= lt!477258 call!45505)))

(assert (=> b!1075364 (= e!614589 (+!3251 call!45505 (tuple2!16703 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000) (get!17232 (select (arr!33155 _values!955) #b00000000000000000000000000000000) (dynLambda!2031 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075365 () Bool)

(assert (=> b!1075365 (= e!614587 e!614589)))

(declare-fun c!108036 () Bool)

(assert (=> b!1075365 (= c!108036 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075366 () Bool)

(declare-fun e!614588 () Bool)

(assert (=> b!1075366 (= e!614586 e!614588)))

(declare-fun c!108035 () Bool)

(declare-fun e!614584 () Bool)

(assert (=> b!1075366 (= c!108035 e!614584)))

(declare-fun res!716905 () Bool)

(assert (=> b!1075366 (=> (not res!716905) (not e!614584))))

(assert (=> b!1075366 (= res!716905 (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(declare-fun b!1075367 () Bool)

(assert (=> b!1075367 (= e!614587 (ListLongMap!14672 Nil!23220))))

(declare-fun bm!45502 () Bool)

(assert (=> bm!45502 (= call!45505 (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075368 () Bool)

(assert (=> b!1075368 (= e!614588 e!614585)))

(declare-fun c!108034 () Bool)

(assert (=> b!1075368 (= c!108034 (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(declare-fun b!1075369 () Bool)

(declare-fun e!614590 () Bool)

(assert (=> b!1075369 (= e!614588 e!614590)))

(assert (=> b!1075369 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(declare-fun res!716904 () Bool)

(assert (=> b!1075369 (= res!716904 (contains!6316 lt!477254 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075369 (=> (not res!716904) (not e!614590))))

(declare-fun b!1075370 () Bool)

(assert (=> b!1075370 (= e!614585 (= lt!477254 (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075371 () Bool)

(declare-fun res!716903 () Bool)

(assert (=> b!1075371 (=> (not res!716903) (not e!614586))))

(assert (=> b!1075371 (= res!716903 (not (contains!6316 lt!477254 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075372 () Bool)

(assert (=> b!1075372 (= e!614584 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075372 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075373 () Bool)

(assert (=> b!1075373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(assert (=> b!1075373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33693 _values!955)))))

(assert (=> b!1075373 (= e!614590 (= (apply!932 lt!477254 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)) (get!17232 (select (arr!33155 _values!955) #b00000000000000000000000000000000) (dynLambda!2031 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!129441 c!108033) b!1075367))

(assert (= (and d!129441 (not c!108033)) b!1075365))

(assert (= (and b!1075365 c!108036) b!1075364))

(assert (= (and b!1075365 (not c!108036)) b!1075363))

(assert (= (or b!1075364 b!1075363) bm!45502))

(assert (= (and d!129441 res!716906) b!1075371))

(assert (= (and b!1075371 res!716903) b!1075366))

(assert (= (and b!1075366 res!716905) b!1075372))

(assert (= (and b!1075366 c!108035) b!1075369))

(assert (= (and b!1075366 (not c!108035)) b!1075368))

(assert (= (and b!1075369 res!716904) b!1075373))

(assert (= (and b!1075368 c!108034) b!1075370))

(assert (= (and b!1075368 (not c!108034)) b!1075362))

(declare-fun b_lambda!16857 () Bool)

(assert (=> (not b_lambda!16857) (not b!1075364)))

(assert (=> b!1075364 t!32569))

(declare-fun b_and!35119 () Bool)

(assert (= b_and!35117 (and (=> t!32569 result!14819) b_and!35119)))

(declare-fun b_lambda!16859 () Bool)

(assert (=> (not b_lambda!16859) (not b!1075373)))

(assert (=> b!1075373 t!32569))

(declare-fun b_and!35121 () Bool)

(assert (= b_and!35119 (and (=> t!32569 result!14819) b_and!35121)))

(declare-fun m!993703 () Bool)

(assert (=> bm!45502 m!993703))

(declare-fun m!993705 () Bool)

(assert (=> b!1075362 m!993705))

(assert (=> b!1075365 m!993637))

(assert (=> b!1075365 m!993637))

(assert (=> b!1075365 m!993639))

(assert (=> b!1075373 m!993643))

(assert (=> b!1075373 m!993645))

(assert (=> b!1075373 m!993637))

(assert (=> b!1075373 m!993637))

(declare-fun m!993707 () Bool)

(assert (=> b!1075373 m!993707))

(assert (=> b!1075373 m!993645))

(assert (=> b!1075373 m!993643))

(assert (=> b!1075373 m!993649))

(declare-fun m!993709 () Bool)

(assert (=> d!129441 m!993709))

(assert (=> d!129441 m!993555))

(declare-fun m!993711 () Bool)

(assert (=> b!1075371 m!993711))

(assert (=> b!1075369 m!993637))

(assert (=> b!1075369 m!993637))

(declare-fun m!993713 () Bool)

(assert (=> b!1075369 m!993713))

(assert (=> b!1075364 m!993643))

(assert (=> b!1075364 m!993645))

(assert (=> b!1075364 m!993637))

(declare-fun m!993715 () Bool)

(assert (=> b!1075364 m!993715))

(assert (=> b!1075364 m!993715))

(declare-fun m!993717 () Bool)

(assert (=> b!1075364 m!993717))

(declare-fun m!993719 () Bool)

(assert (=> b!1075364 m!993719))

(declare-fun m!993721 () Bool)

(assert (=> b!1075364 m!993721))

(assert (=> b!1075364 m!993645))

(assert (=> b!1075364 m!993643))

(assert (=> b!1075364 m!993649))

(assert (=> b!1075372 m!993637))

(assert (=> b!1075372 m!993637))

(assert (=> b!1075372 m!993639))

(assert (=> b!1075370 m!993703))

(assert (=> b!1075196 d!129441))

(declare-fun b!1075374 () Bool)

(declare-fun e!614592 () Bool)

(declare-fun lt!477261 () ListLongMap!14671)

(assert (=> b!1075374 (= e!614592 (isEmpty!962 lt!477261))))

(declare-fun b!1075375 () Bool)

(declare-fun e!614596 () ListLongMap!14671)

(declare-fun call!45506 () ListLongMap!14671)

(assert (=> b!1075375 (= e!614596 call!45506)))

(declare-fun d!129443 () Bool)

(declare-fun e!614593 () Bool)

(assert (=> d!129443 e!614593))

(declare-fun res!716910 () Bool)

(assert (=> d!129443 (=> (not res!716910) (not e!614593))))

(assert (=> d!129443 (= res!716910 (not (contains!6316 lt!477261 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!614594 () ListLongMap!14671)

(assert (=> d!129443 (= lt!477261 e!614594)))

(declare-fun c!108037 () Bool)

(assert (=> d!129443 (= c!108037 (bvsge #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(assert (=> d!129443 (validMask!0 mask!1515)))

(assert (=> d!129443 (= (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477261)))

(declare-fun b!1075376 () Bool)

(declare-fun lt!477263 () Unit!35247)

(declare-fun lt!477262 () Unit!35247)

(assert (=> b!1075376 (= lt!477263 lt!477262)))

(declare-fun lt!477265 () ListLongMap!14671)

(declare-fun lt!477264 () (_ BitVec 64))

(declare-fun lt!477266 () (_ BitVec 64))

(declare-fun lt!477260 () V!39825)

(assert (=> b!1075376 (not (contains!6316 (+!3251 lt!477265 (tuple2!16703 lt!477266 lt!477260)) lt!477264))))

(assert (=> b!1075376 (= lt!477262 (addStillNotContains!268 lt!477265 lt!477266 lt!477260 lt!477264))))

(assert (=> b!1075376 (= lt!477264 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075376 (= lt!477260 (get!17232 (select (arr!33155 _values!955) #b00000000000000000000000000000000) (dynLambda!2031 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075376 (= lt!477266 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075376 (= lt!477265 call!45506)))

(assert (=> b!1075376 (= e!614596 (+!3251 call!45506 (tuple2!16703 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000) (get!17232 (select (arr!33155 _values!955) #b00000000000000000000000000000000) (dynLambda!2031 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1075377 () Bool)

(assert (=> b!1075377 (= e!614594 e!614596)))

(declare-fun c!108040 () Bool)

(assert (=> b!1075377 (= c!108040 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075378 () Bool)

(declare-fun e!614595 () Bool)

(assert (=> b!1075378 (= e!614593 e!614595)))

(declare-fun c!108039 () Bool)

(declare-fun e!614591 () Bool)

(assert (=> b!1075378 (= c!108039 e!614591)))

(declare-fun res!716909 () Bool)

(assert (=> b!1075378 (=> (not res!716909) (not e!614591))))

(assert (=> b!1075378 (= res!716909 (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(declare-fun b!1075379 () Bool)

(assert (=> b!1075379 (= e!614594 (ListLongMap!14672 Nil!23220))))

(declare-fun bm!45503 () Bool)

(assert (=> bm!45503 (= call!45506 (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075380 () Bool)

(assert (=> b!1075380 (= e!614595 e!614592)))

(declare-fun c!108038 () Bool)

(assert (=> b!1075380 (= c!108038 (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(declare-fun b!1075381 () Bool)

(declare-fun e!614597 () Bool)

(assert (=> b!1075381 (= e!614595 e!614597)))

(assert (=> b!1075381 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(declare-fun res!716908 () Bool)

(assert (=> b!1075381 (= res!716908 (contains!6316 lt!477261 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075381 (=> (not res!716908) (not e!614597))))

(declare-fun b!1075382 () Bool)

(assert (=> b!1075382 (= e!614592 (= lt!477261 (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075383 () Bool)

(declare-fun res!716907 () Bool)

(assert (=> b!1075383 (=> (not res!716907) (not e!614593))))

(assert (=> b!1075383 (= res!716907 (not (contains!6316 lt!477261 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075384 () Bool)

(assert (=> b!1075384 (= e!614591 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075384 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075385 () Bool)

(assert (=> b!1075385 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(assert (=> b!1075385 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33693 _values!955)))))

(assert (=> b!1075385 (= e!614597 (= (apply!932 lt!477261 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)) (get!17232 (select (arr!33155 _values!955) #b00000000000000000000000000000000) (dynLambda!2031 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!129443 c!108037) b!1075379))

(assert (= (and d!129443 (not c!108037)) b!1075377))

(assert (= (and b!1075377 c!108040) b!1075376))

(assert (= (and b!1075377 (not c!108040)) b!1075375))

(assert (= (or b!1075376 b!1075375) bm!45503))

(assert (= (and d!129443 res!716910) b!1075383))

(assert (= (and b!1075383 res!716907) b!1075378))

(assert (= (and b!1075378 res!716909) b!1075384))

(assert (= (and b!1075378 c!108039) b!1075381))

(assert (= (and b!1075378 (not c!108039)) b!1075380))

(assert (= (and b!1075381 res!716908) b!1075385))

(assert (= (and b!1075380 c!108038) b!1075382))

(assert (= (and b!1075380 (not c!108038)) b!1075374))

(declare-fun b_lambda!16861 () Bool)

(assert (=> (not b_lambda!16861) (not b!1075376)))

(assert (=> b!1075376 t!32569))

(declare-fun b_and!35123 () Bool)

(assert (= b_and!35121 (and (=> t!32569 result!14819) b_and!35123)))

(declare-fun b_lambda!16863 () Bool)

(assert (=> (not b_lambda!16863) (not b!1075385)))

(assert (=> b!1075385 t!32569))

(declare-fun b_and!35125 () Bool)

(assert (= b_and!35123 (and (=> t!32569 result!14819) b_and!35125)))

(declare-fun m!993723 () Bool)

(assert (=> bm!45503 m!993723))

(declare-fun m!993725 () Bool)

(assert (=> b!1075374 m!993725))

(assert (=> b!1075377 m!993637))

(assert (=> b!1075377 m!993637))

(assert (=> b!1075377 m!993639))

(assert (=> b!1075385 m!993643))

(assert (=> b!1075385 m!993645))

(assert (=> b!1075385 m!993637))

(assert (=> b!1075385 m!993637))

(declare-fun m!993727 () Bool)

(assert (=> b!1075385 m!993727))

(assert (=> b!1075385 m!993645))

(assert (=> b!1075385 m!993643))

(assert (=> b!1075385 m!993649))

(declare-fun m!993729 () Bool)

(assert (=> d!129443 m!993729))

(assert (=> d!129443 m!993555))

(declare-fun m!993731 () Bool)

(assert (=> b!1075383 m!993731))

(assert (=> b!1075381 m!993637))

(assert (=> b!1075381 m!993637))

(declare-fun m!993733 () Bool)

(assert (=> b!1075381 m!993733))

(assert (=> b!1075376 m!993643))

(assert (=> b!1075376 m!993645))

(assert (=> b!1075376 m!993637))

(declare-fun m!993735 () Bool)

(assert (=> b!1075376 m!993735))

(assert (=> b!1075376 m!993735))

(declare-fun m!993737 () Bool)

(assert (=> b!1075376 m!993737))

(declare-fun m!993739 () Bool)

(assert (=> b!1075376 m!993739))

(declare-fun m!993741 () Bool)

(assert (=> b!1075376 m!993741))

(assert (=> b!1075376 m!993645))

(assert (=> b!1075376 m!993643))

(assert (=> b!1075376 m!993649))

(assert (=> b!1075384 m!993637))

(assert (=> b!1075384 m!993637))

(assert (=> b!1075384 m!993639))

(assert (=> b!1075382 m!993723))

(assert (=> b!1075196 d!129443))

(declare-fun b!1075396 () Bool)

(declare-fun e!614606 () Bool)

(declare-fun call!45509 () Bool)

(assert (=> b!1075396 (= e!614606 call!45509)))

(declare-fun b!1075397 () Bool)

(declare-fun e!614609 () Bool)

(declare-fun e!614607 () Bool)

(assert (=> b!1075397 (= e!614609 e!614607)))

(declare-fun res!716918 () Bool)

(assert (=> b!1075397 (=> (not res!716918) (not e!614607))))

(declare-fun e!614608 () Bool)

(assert (=> b!1075397 (= res!716918 (not e!614608))))

(declare-fun res!716917 () Bool)

(assert (=> b!1075397 (=> (not res!716917) (not e!614608))))

(assert (=> b!1075397 (= res!716917 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075398 () Bool)

(declare-fun contains!6317 (List!23224 (_ BitVec 64)) Bool)

(assert (=> b!1075398 (= e!614608 (contains!6317 Nil!23221 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45506 () Bool)

(declare-fun c!108043 () Bool)

(assert (=> bm!45506 (= call!45509 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108043 (Cons!23220 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000) Nil!23221) Nil!23221)))))

(declare-fun b!1075399 () Bool)

(assert (=> b!1075399 (= e!614606 call!45509)))

(declare-fun b!1075400 () Bool)

(assert (=> b!1075400 (= e!614607 e!614606)))

(assert (=> b!1075400 (= c!108043 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129445 () Bool)

(declare-fun res!716919 () Bool)

(assert (=> d!129445 (=> res!716919 e!614609)))

(assert (=> d!129445 (= res!716919 (bvsge #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(assert (=> d!129445 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23221) e!614609)))

(assert (= (and d!129445 (not res!716919)) b!1075397))

(assert (= (and b!1075397 res!716917) b!1075398))

(assert (= (and b!1075397 res!716918) b!1075400))

(assert (= (and b!1075400 c!108043) b!1075399))

(assert (= (and b!1075400 (not c!108043)) b!1075396))

(assert (= (or b!1075399 b!1075396) bm!45506))

(assert (=> b!1075397 m!993637))

(assert (=> b!1075397 m!993637))

(assert (=> b!1075397 m!993639))

(assert (=> b!1075398 m!993637))

(assert (=> b!1075398 m!993637))

(declare-fun m!993743 () Bool)

(assert (=> b!1075398 m!993743))

(assert (=> bm!45506 m!993637))

(declare-fun m!993745 () Bool)

(assert (=> bm!45506 m!993745))

(assert (=> b!1075400 m!993637))

(assert (=> b!1075400 m!993637))

(assert (=> b!1075400 m!993639))

(assert (=> b!1075195 d!129445))

(declare-fun d!129447 () Bool)

(assert (=> d!129447 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95122 d!129447))

(declare-fun d!129449 () Bool)

(assert (=> d!129449 (= (array_inv!25650 _values!955) (bvsge (size!33693 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95122 d!129449))

(declare-fun d!129451 () Bool)

(assert (=> d!129451 (= (array_inv!25651 _keys!1163) (bvsge (size!33694 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95122 d!129451))

(declare-fun bm!45507 () Bool)

(declare-fun call!45510 () ListLongMap!14671)

(declare-fun call!45516 () ListLongMap!14671)

(assert (=> bm!45507 (= call!45510 call!45516)))

(declare-fun b!1075401 () Bool)

(declare-fun e!614611 () Bool)

(declare-fun lt!477279 () ListLongMap!14671)

(assert (=> b!1075401 (= e!614611 (= (apply!932 lt!477279 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1075402 () Bool)

(declare-fun e!614617 () Bool)

(declare-fun call!45511 () Bool)

(assert (=> b!1075402 (= e!614617 (not call!45511))))

(declare-fun bm!45508 () Bool)

(declare-fun call!45513 () ListLongMap!14671)

(declare-fun call!45512 () ListLongMap!14671)

(assert (=> bm!45508 (= call!45513 call!45512)))

(declare-fun b!1075403 () Bool)

(declare-fun e!614622 () Bool)

(assert (=> b!1075403 (= e!614622 (= (apply!932 lt!477279 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)) (get!17232 (select (arr!33155 _values!955) #b00000000000000000000000000000000) (dynLambda!2031 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075403 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33693 _values!955)))))

(assert (=> b!1075403 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(declare-fun b!1075404 () Bool)

(declare-fun e!614618 () Bool)

(assert (=> b!1075404 (= e!614618 e!614622)))

(declare-fun res!716924 () Bool)

(assert (=> b!1075404 (=> (not res!716924) (not e!614622))))

(assert (=> b!1075404 (= res!716924 (contains!6316 lt!477279 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075404 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(declare-fun bm!45509 () Bool)

(declare-fun call!45514 () ListLongMap!14671)

(assert (=> bm!45509 (= call!45514 call!45510)))

(declare-fun b!1075405 () Bool)

(declare-fun e!614612 () Bool)

(assert (=> b!1075405 (= e!614612 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075406 () Bool)

(declare-fun res!716922 () Bool)

(declare-fun e!614620 () Bool)

(assert (=> b!1075406 (=> (not res!716922) (not e!614620))))

(assert (=> b!1075406 (= res!716922 e!614618)))

(declare-fun res!716925 () Bool)

(assert (=> b!1075406 (=> res!716925 e!614618)))

(assert (=> b!1075406 (= res!716925 (not e!614612))))

(declare-fun res!716927 () Bool)

(assert (=> b!1075406 (=> (not res!716927) (not e!614612))))

(assert (=> b!1075406 (= res!716927 (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(declare-fun bm!45510 () Bool)

(assert (=> bm!45510 (= call!45511 (contains!6316 lt!477279 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075407 () Bool)

(declare-fun e!614621 () ListLongMap!14671)

(assert (=> b!1075407 (= e!614621 call!45513)))

(declare-fun b!1075408 () Bool)

(declare-fun e!614614 () Bool)

(assert (=> b!1075408 (= e!614617 e!614614)))

(declare-fun res!716920 () Bool)

(assert (=> b!1075408 (= res!716920 call!45511)))

(assert (=> b!1075408 (=> (not res!716920) (not e!614614))))

(declare-fun b!1075409 () Bool)

(assert (=> b!1075409 (= e!614620 e!614617)))

(declare-fun c!108045 () Bool)

(assert (=> b!1075409 (= c!108045 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075410 () Bool)

(declare-fun res!716921 () Bool)

(assert (=> b!1075410 (=> (not res!716921) (not e!614620))))

(declare-fun e!614619 () Bool)

(assert (=> b!1075410 (= res!716921 e!614619)))

(declare-fun c!108046 () Bool)

(assert (=> b!1075410 (= c!108046 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075411 () Bool)

(declare-fun call!45515 () Bool)

(assert (=> b!1075411 (= e!614619 (not call!45515))))

(declare-fun b!1075412 () Bool)

(declare-fun e!614610 () Unit!35247)

(declare-fun lt!477278 () Unit!35247)

(assert (=> b!1075412 (= e!614610 lt!477278)))

(declare-fun lt!477274 () ListLongMap!14671)

(assert (=> b!1075412 (= lt!477274 (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477275 () (_ BitVec 64))

(assert (=> b!1075412 (= lt!477275 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477271 () (_ BitVec 64))

(assert (=> b!1075412 (= lt!477271 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477272 () Unit!35247)

(assert (=> b!1075412 (= lt!477272 (addStillContains!645 lt!477274 lt!477275 zeroValueAfter!47 lt!477271))))

(assert (=> b!1075412 (contains!6316 (+!3251 lt!477274 (tuple2!16703 lt!477275 zeroValueAfter!47)) lt!477271)))

(declare-fun lt!477270 () Unit!35247)

(assert (=> b!1075412 (= lt!477270 lt!477272)))

(declare-fun lt!477281 () ListLongMap!14671)

(assert (=> b!1075412 (= lt!477281 (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477268 () (_ BitVec 64))

(assert (=> b!1075412 (= lt!477268 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477284 () (_ BitVec 64))

(assert (=> b!1075412 (= lt!477284 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477276 () Unit!35247)

(assert (=> b!1075412 (= lt!477276 (addApplyDifferent!501 lt!477281 lt!477268 minValue!907 lt!477284))))

(assert (=> b!1075412 (= (apply!932 (+!3251 lt!477281 (tuple2!16703 lt!477268 minValue!907)) lt!477284) (apply!932 lt!477281 lt!477284))))

(declare-fun lt!477288 () Unit!35247)

(assert (=> b!1075412 (= lt!477288 lt!477276)))

(declare-fun lt!477285 () ListLongMap!14671)

(assert (=> b!1075412 (= lt!477285 (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477287 () (_ BitVec 64))

(assert (=> b!1075412 (= lt!477287 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477277 () (_ BitVec 64))

(assert (=> b!1075412 (= lt!477277 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477286 () Unit!35247)

(assert (=> b!1075412 (= lt!477286 (addApplyDifferent!501 lt!477285 lt!477287 zeroValueAfter!47 lt!477277))))

(assert (=> b!1075412 (= (apply!932 (+!3251 lt!477285 (tuple2!16703 lt!477287 zeroValueAfter!47)) lt!477277) (apply!932 lt!477285 lt!477277))))

(declare-fun lt!477283 () Unit!35247)

(assert (=> b!1075412 (= lt!477283 lt!477286)))

(declare-fun lt!477282 () ListLongMap!14671)

(assert (=> b!1075412 (= lt!477282 (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477267 () (_ BitVec 64))

(assert (=> b!1075412 (= lt!477267 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477273 () (_ BitVec 64))

(assert (=> b!1075412 (= lt!477273 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075412 (= lt!477278 (addApplyDifferent!501 lt!477282 lt!477267 minValue!907 lt!477273))))

(assert (=> b!1075412 (= (apply!932 (+!3251 lt!477282 (tuple2!16703 lt!477267 minValue!907)) lt!477273) (apply!932 lt!477282 lt!477273))))

(declare-fun c!108049 () Bool)

(declare-fun c!108047 () Bool)

(declare-fun bm!45511 () Bool)

(assert (=> bm!45511 (= call!45512 (+!3251 (ite c!108047 call!45516 (ite c!108049 call!45510 call!45514)) (ite (or c!108047 c!108049) (tuple2!16703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075413 () Bool)

(assert (=> b!1075413 (= e!614619 e!614611)))

(declare-fun res!716928 () Bool)

(assert (=> b!1075413 (= res!716928 call!45515)))

(assert (=> b!1075413 (=> (not res!716928) (not e!614611))))

(declare-fun b!1075414 () Bool)

(declare-fun e!614613 () Bool)

(assert (=> b!1075414 (= e!614613 (validKeyInArray!0 (select (arr!33156 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075415 () Bool)

(declare-fun c!108044 () Bool)

(assert (=> b!1075415 (= c!108044 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!614616 () ListLongMap!14671)

(assert (=> b!1075415 (= e!614621 e!614616)))

(declare-fun b!1075416 () Bool)

(declare-fun e!614615 () ListLongMap!14671)

(assert (=> b!1075416 (= e!614615 (+!3251 call!45512 (tuple2!16703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun d!129453 () Bool)

(assert (=> d!129453 e!614620))

(declare-fun res!716923 () Bool)

(assert (=> d!129453 (=> (not res!716923) (not e!614620))))

(assert (=> d!129453 (= res!716923 (or (bvsge #b00000000000000000000000000000000 (size!33694 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))))

(declare-fun lt!477280 () ListLongMap!14671)

(assert (=> d!129453 (= lt!477279 lt!477280)))

(declare-fun lt!477269 () Unit!35247)

(assert (=> d!129453 (= lt!477269 e!614610)))

(declare-fun c!108048 () Bool)

(assert (=> d!129453 (= c!108048 e!614613)))

(declare-fun res!716926 () Bool)

(assert (=> d!129453 (=> (not res!716926) (not e!614613))))

(assert (=> d!129453 (= res!716926 (bvslt #b00000000000000000000000000000000 (size!33694 _keys!1163)))))

(assert (=> d!129453 (= lt!477280 e!614615)))

(assert (=> d!129453 (= c!108047 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129453 (validMask!0 mask!1515)))

(assert (=> d!129453 (= (getCurrentListMap!4119 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477279)))

(declare-fun b!1075417 () Bool)

(assert (=> b!1075417 (= e!614616 call!45514)))

(declare-fun bm!45512 () Bool)

(assert (=> bm!45512 (= call!45515 (contains!6316 lt!477279 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075418 () Bool)

(declare-fun Unit!35253 () Unit!35247)

(assert (=> b!1075418 (= e!614610 Unit!35253)))

(declare-fun b!1075419 () Bool)

(assert (=> b!1075419 (= e!614615 e!614621)))

(assert (=> b!1075419 (= c!108049 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075420 () Bool)

(assert (=> b!1075420 (= e!614616 call!45513)))

(declare-fun b!1075421 () Bool)

(assert (=> b!1075421 (= e!614614 (= (apply!932 lt!477279 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45513 () Bool)

(assert (=> bm!45513 (= call!45516 (getCurrentListMapNoExtraKeys!3929 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and d!129453 c!108047) b!1075416))

(assert (= (and d!129453 (not c!108047)) b!1075419))

(assert (= (and b!1075419 c!108049) b!1075407))

(assert (= (and b!1075419 (not c!108049)) b!1075415))

(assert (= (and b!1075415 c!108044) b!1075420))

(assert (= (and b!1075415 (not c!108044)) b!1075417))

(assert (= (or b!1075420 b!1075417) bm!45509))

(assert (= (or b!1075407 bm!45509) bm!45507))

(assert (= (or b!1075407 b!1075420) bm!45508))

(assert (= (or b!1075416 bm!45507) bm!45513))

(assert (= (or b!1075416 bm!45508) bm!45511))

(assert (= (and d!129453 res!716926) b!1075414))

(assert (= (and d!129453 c!108048) b!1075412))

(assert (= (and d!129453 (not c!108048)) b!1075418))

(assert (= (and d!129453 res!716923) b!1075406))

(assert (= (and b!1075406 res!716927) b!1075405))

(assert (= (and b!1075406 (not res!716925)) b!1075404))

(assert (= (and b!1075404 res!716924) b!1075403))

(assert (= (and b!1075406 res!716922) b!1075410))

(assert (= (and b!1075410 c!108046) b!1075413))

(assert (= (and b!1075410 (not c!108046)) b!1075411))

(assert (= (and b!1075413 res!716928) b!1075401))

(assert (= (or b!1075413 b!1075411) bm!45512))

(assert (= (and b!1075410 res!716921) b!1075409))

(assert (= (and b!1075409 c!108045) b!1075408))

(assert (= (and b!1075409 (not c!108045)) b!1075402))

(assert (= (and b!1075408 res!716920) b!1075421))

(assert (= (or b!1075408 b!1075402) bm!45510))

(declare-fun b_lambda!16865 () Bool)

(assert (=> (not b_lambda!16865) (not b!1075403)))

(assert (=> b!1075403 t!32569))

(declare-fun b_and!35127 () Bool)

(assert (= b_and!35125 (and (=> t!32569 result!14819) b_and!35127)))

(assert (=> b!1075414 m!993637))

(assert (=> b!1075414 m!993637))

(assert (=> b!1075414 m!993639))

(assert (=> b!1075405 m!993637))

(assert (=> b!1075405 m!993637))

(assert (=> b!1075405 m!993639))

(declare-fun m!993747 () Bool)

(assert (=> bm!45512 m!993747))

(assert (=> b!1075403 m!993643))

(assert (=> b!1075403 m!993645))

(assert (=> b!1075403 m!993637))

(declare-fun m!993749 () Bool)

(assert (=> b!1075403 m!993749))

(assert (=> b!1075403 m!993637))

(assert (=> b!1075403 m!993645))

(assert (=> b!1075403 m!993643))

(assert (=> b!1075403 m!993649))

(declare-fun m!993751 () Bool)

(assert (=> b!1075421 m!993751))

(declare-fun m!993753 () Bool)

(assert (=> bm!45511 m!993753))

(assert (=> d!129453 m!993555))

(declare-fun m!993755 () Bool)

(assert (=> b!1075412 m!993755))

(assert (=> b!1075412 m!993755))

(declare-fun m!993757 () Bool)

(assert (=> b!1075412 m!993757))

(declare-fun m!993759 () Bool)

(assert (=> b!1075412 m!993759))

(declare-fun m!993761 () Bool)

(assert (=> b!1075412 m!993761))

(declare-fun m!993763 () Bool)

(assert (=> b!1075412 m!993763))

(declare-fun m!993765 () Bool)

(assert (=> b!1075412 m!993765))

(declare-fun m!993767 () Bool)

(assert (=> b!1075412 m!993767))

(declare-fun m!993769 () Bool)

(assert (=> b!1075412 m!993769))

(declare-fun m!993771 () Bool)

(assert (=> b!1075412 m!993771))

(assert (=> b!1075412 m!993637))

(declare-fun m!993773 () Bool)

(assert (=> b!1075412 m!993773))

(assert (=> b!1075412 m!993767))

(declare-fun m!993775 () Bool)

(assert (=> b!1075412 m!993775))

(declare-fun m!993777 () Bool)

(assert (=> b!1075412 m!993777))

(declare-fun m!993779 () Bool)

(assert (=> b!1075412 m!993779))

(declare-fun m!993781 () Bool)

(assert (=> b!1075412 m!993781))

(assert (=> b!1075412 m!993771))

(declare-fun m!993783 () Bool)

(assert (=> b!1075412 m!993783))

(assert (=> b!1075412 m!993569))

(assert (=> b!1075412 m!993759))

(assert (=> b!1075404 m!993637))

(assert (=> b!1075404 m!993637))

(declare-fun m!993785 () Bool)

(assert (=> b!1075404 m!993785))

(declare-fun m!993787 () Bool)

(assert (=> b!1075401 m!993787))

(declare-fun m!993789 () Bool)

(assert (=> bm!45510 m!993789))

(declare-fun m!993791 () Bool)

(assert (=> b!1075416 m!993791))

(assert (=> bm!45513 m!993569))

(assert (=> b!1075193 d!129453))

(declare-fun d!129455 () Bool)

(declare-fun lt!477291 () ListLongMap!14671)

(assert (=> d!129455 (not (contains!6316 lt!477291 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!76 (List!23223 (_ BitVec 64)) List!23223)

(assert (=> d!129455 (= lt!477291 (ListLongMap!14672 (removeStrictlySorted!76 (toList!7351 lt!477107) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129455 (= (-!695 lt!477107 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477291)))

(declare-fun bs!31655 () Bool)

(assert (= bs!31655 d!129455))

(declare-fun m!993793 () Bool)

(assert (=> bs!31655 m!993793))

(declare-fun m!993795 () Bool)

(assert (=> bs!31655 m!993795))

(assert (=> b!1075193 d!129455))

(declare-fun d!129457 () Bool)

(assert (=> d!129457 (= (-!695 lt!477107 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477107)))

(declare-fun lt!477294 () Unit!35247)

(declare-fun choose!1762 (ListLongMap!14671 (_ BitVec 64)) Unit!35247)

(assert (=> d!129457 (= lt!477294 (choose!1762 lt!477107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129457 (not (contains!6316 lt!477107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129457 (= (removeNotPresentStillSame!73 lt!477107 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477294)))

(declare-fun bs!31656 () Bool)

(assert (= bs!31656 d!129457))

(assert (=> bs!31656 m!993551))

(declare-fun m!993797 () Bool)

(assert (=> bs!31656 m!993797))

(assert (=> bs!31656 m!993561))

(assert (=> b!1075193 d!129457))

(declare-fun b!1075429 () Bool)

(declare-fun e!614628 () Bool)

(assert (=> b!1075429 (= e!614628 tp_is_empty!26017)))

(declare-fun condMapEmpty!40768 () Bool)

(declare-fun mapDefault!40768 () ValueCell!12305)

(assert (=> mapNonEmpty!40759 (= condMapEmpty!40768 (= mapRest!40759 ((as const (Array (_ BitVec 32) ValueCell!12305)) mapDefault!40768)))))

(declare-fun mapRes!40768 () Bool)

(assert (=> mapNonEmpty!40759 (= tp!78106 (and e!614628 mapRes!40768))))

(declare-fun mapIsEmpty!40768 () Bool)

(assert (=> mapIsEmpty!40768 mapRes!40768))

(declare-fun b!1075428 () Bool)

(declare-fun e!614627 () Bool)

(assert (=> b!1075428 (= e!614627 tp_is_empty!26017)))

(declare-fun mapNonEmpty!40768 () Bool)

(declare-fun tp!78122 () Bool)

(assert (=> mapNonEmpty!40768 (= mapRes!40768 (and tp!78122 e!614627))))

(declare-fun mapValue!40768 () ValueCell!12305)

(declare-fun mapKey!40768 () (_ BitVec 32))

(declare-fun mapRest!40768 () (Array (_ BitVec 32) ValueCell!12305))

(assert (=> mapNonEmpty!40768 (= mapRest!40759 (store mapRest!40768 mapKey!40768 mapValue!40768))))

(assert (= (and mapNonEmpty!40759 condMapEmpty!40768) mapIsEmpty!40768))

(assert (= (and mapNonEmpty!40759 (not condMapEmpty!40768)) mapNonEmpty!40768))

(assert (= (and mapNonEmpty!40768 ((_ is ValueCellFull!12305) mapValue!40768)) b!1075428))

(assert (= (and mapNonEmpty!40759 ((_ is ValueCellFull!12305) mapDefault!40768)) b!1075429))

(declare-fun m!993799 () Bool)

(assert (=> mapNonEmpty!40768 m!993799))

(declare-fun b_lambda!16867 () Bool)

(assert (= b_lambda!16861 (or (and start!95122 b_free!22207) b_lambda!16867)))

(declare-fun b_lambda!16869 () Bool)

(assert (= b_lambda!16855 (or (and start!95122 b_free!22207) b_lambda!16869)))

(declare-fun b_lambda!16871 () Bool)

(assert (= b_lambda!16857 (or (and start!95122 b_free!22207) b_lambda!16871)))

(declare-fun b_lambda!16873 () Bool)

(assert (= b_lambda!16859 (or (and start!95122 b_free!22207) b_lambda!16873)))

(declare-fun b_lambda!16875 () Bool)

(assert (= b_lambda!16863 (or (and start!95122 b_free!22207) b_lambda!16875)))

(declare-fun b_lambda!16877 () Bool)

(assert (= b_lambda!16865 (or (and start!95122 b_free!22207) b_lambda!16877)))

(check-sat tp_is_empty!26017 (not d!129455) (not d!129453) (not b_next!22207) (not bm!45506) (not b!1075374) (not b!1075372) (not b!1075318) (not b!1075412) (not bm!45495) (not b!1075369) (not bm!45512) (not b!1075370) (not bm!45494) (not b_lambda!16873) (not bm!45513) (not b!1075377) (not b!1075258) (not b!1075316) (not bm!45499) (not bm!45502) (not b!1075314) (not b!1075373) (not b!1075306) (not bm!45493) (not b!1075364) (not d!129433) (not b!1075382) (not b_lambda!16871) (not b!1075421) (not b!1075376) (not b!1075323) (not b_lambda!16875) (not b!1075337) (not b!1075405) (not b_lambda!16867) (not b!1075371) (not b!1075416) (not bm!45511) (not b_lambda!16869) (not b!1075401) (not b!1075384) (not mapNonEmpty!40768) (not b!1075403) (not b!1075260) (not b_lambda!16877) (not b!1075336) (not bm!45503) (not d!129457) (not b!1075305) (not b!1075385) (not b!1075414) (not b!1075381) (not bm!45510) (not b!1075398) (not b!1075362) b_and!35127 (not b!1075307) (not b!1075404) (not bm!45496) (not d!129435) (not d!129441) (not b!1075400) (not d!129439) (not b!1075383) (not d!129443) (not b!1075397) (not b!1075303) (not b!1075365))
(check-sat b_and!35127 (not b_next!22207))
