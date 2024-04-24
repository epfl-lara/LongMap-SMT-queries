; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94112 () Bool)

(assert start!94112)

(declare-fun b_free!21349 () Bool)

(declare-fun b_next!21349 () Bool)

(assert (=> start!94112 (= b_free!21349 (not b_next!21349))))

(declare-fun tp!75470 () Bool)

(declare-fun b_and!34073 () Bool)

(assert (=> start!94112 (= tp!75470 b_and!34073)))

(declare-fun b!1063053 () Bool)

(declare-fun res!709510 () Bool)

(declare-fun e!605507 () Bool)

(assert (=> b!1063053 (=> (not res!709510) (not e!605507))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38681 0))(
  ( (V!38682 (val!12630 Int)) )
))
(declare-datatypes ((ValueCell!11876 0))(
  ( (ValueCellFull!11876 (v!15236 V!38681)) (EmptyCell!11876) )
))
(declare-datatypes ((array!67369 0))(
  ( (array!67370 (arr!32386 (Array (_ BitVec 32) ValueCell!11876)) (size!32923 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67369)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67371 0))(
  ( (array!67372 (arr!32387 (Array (_ BitVec 32) (_ BitVec 64))) (size!32924 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67371)

(assert (=> b!1063053 (= res!709510 (and (= (size!32923 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32924 _keys!1163) (size!32923 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39409 () Bool)

(declare-fun mapRes!39409 () Bool)

(declare-fun tp!75469 () Bool)

(declare-fun e!605508 () Bool)

(assert (=> mapNonEmpty!39409 (= mapRes!39409 (and tp!75469 e!605508))))

(declare-fun mapKey!39409 () (_ BitVec 32))

(declare-fun mapValue!39409 () ValueCell!11876)

(declare-fun mapRest!39409 () (Array (_ BitVec 32) ValueCell!11876))

(assert (=> mapNonEmpty!39409 (= (arr!32386 _values!955) (store mapRest!39409 mapKey!39409 mapValue!39409))))

(declare-fun b!1063054 () Bool)

(assert (=> b!1063054 (= e!605507 (not (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!32924 _keys!1163)))))))

(declare-datatypes ((tuple2!15954 0))(
  ( (tuple2!15955 (_1!7988 (_ BitVec 64)) (_2!7988 V!38681)) )
))
(declare-datatypes ((List!22541 0))(
  ( (Nil!22538) (Cons!22537 (h!23755 tuple2!15954) (t!31842 List!22541)) )
))
(declare-datatypes ((ListLongMap!13931 0))(
  ( (ListLongMap!13932 (toList!6981 List!22541)) )
))
(declare-fun lt!468236 () ListLongMap!13931)

(declare-fun lt!468237 () ListLongMap!13931)

(assert (=> b!1063054 (= lt!468236 lt!468237)))

(declare-fun zeroValueBefore!47 () V!38681)

(declare-datatypes ((Unit!34767 0))(
  ( (Unit!34768) )
))
(declare-fun lt!468235 () Unit!34767)

(declare-fun minValue!907 () V!38681)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38681)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!632 (array!67371 array!67369 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38681 V!38681 V!38681 V!38681 (_ BitVec 32) Int) Unit!34767)

(assert (=> b!1063054 (= lt!468235 (lemmaNoChangeToArrayThenSameMapNoExtras!632 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3629 (array!67371 array!67369 (_ BitVec 32) (_ BitVec 32) V!38681 V!38681 (_ BitVec 32) Int) ListLongMap!13931)

(assert (=> b!1063054 (= lt!468237 (getCurrentListMapNoExtraKeys!3629 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063054 (= lt!468236 (getCurrentListMapNoExtraKeys!3629 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063055 () Bool)

(declare-fun tp_is_empty!25159 () Bool)

(assert (=> b!1063055 (= e!605508 tp_is_empty!25159)))

(declare-fun b!1063056 () Bool)

(declare-fun e!605504 () Bool)

(assert (=> b!1063056 (= e!605504 tp_is_empty!25159)))

(declare-fun b!1063057 () Bool)

(declare-fun e!605506 () Bool)

(assert (=> b!1063057 (= e!605506 (and e!605504 mapRes!39409))))

(declare-fun condMapEmpty!39409 () Bool)

(declare-fun mapDefault!39409 () ValueCell!11876)

(assert (=> b!1063057 (= condMapEmpty!39409 (= (arr!32386 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11876)) mapDefault!39409)))))

(declare-fun b!1063058 () Bool)

(declare-fun res!709508 () Bool)

(assert (=> b!1063058 (=> (not res!709508) (not e!605507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67371 (_ BitVec 32)) Bool)

(assert (=> b!1063058 (= res!709508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39409 () Bool)

(assert (=> mapIsEmpty!39409 mapRes!39409))

(declare-fun b!1063059 () Bool)

(declare-fun res!709507 () Bool)

(assert (=> b!1063059 (=> (not res!709507) (not e!605507))))

(declare-datatypes ((List!22542 0))(
  ( (Nil!22539) (Cons!22538 (h!23756 (_ BitVec 64)) (t!31843 List!22542)) )
))
(declare-fun arrayNoDuplicates!0 (array!67371 (_ BitVec 32) List!22542) Bool)

(assert (=> b!1063059 (= res!709507 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22539))))

(declare-fun res!709509 () Bool)

(assert (=> start!94112 (=> (not res!709509) (not e!605507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94112 (= res!709509 (validMask!0 mask!1515))))

(assert (=> start!94112 e!605507))

(assert (=> start!94112 true))

(assert (=> start!94112 tp_is_empty!25159))

(declare-fun array_inv!25110 (array!67369) Bool)

(assert (=> start!94112 (and (array_inv!25110 _values!955) e!605506)))

(assert (=> start!94112 tp!75470))

(declare-fun array_inv!25111 (array!67371) Bool)

(assert (=> start!94112 (array_inv!25111 _keys!1163)))

(assert (= (and start!94112 res!709509) b!1063053))

(assert (= (and b!1063053 res!709510) b!1063058))

(assert (= (and b!1063058 res!709508) b!1063059))

(assert (= (and b!1063059 res!709507) b!1063054))

(assert (= (and b!1063057 condMapEmpty!39409) mapIsEmpty!39409))

(assert (= (and b!1063057 (not condMapEmpty!39409)) mapNonEmpty!39409))

(get-info :version)

(assert (= (and mapNonEmpty!39409 ((_ is ValueCellFull!11876) mapValue!39409)) b!1063055))

(assert (= (and b!1063057 ((_ is ValueCellFull!11876) mapDefault!39409)) b!1063056))

(assert (= start!94112 b!1063057))

(declare-fun m!982207 () Bool)

(assert (=> b!1063054 m!982207))

(declare-fun m!982209 () Bool)

(assert (=> b!1063054 m!982209))

(declare-fun m!982211 () Bool)

(assert (=> b!1063054 m!982211))

(declare-fun m!982213 () Bool)

(assert (=> mapNonEmpty!39409 m!982213))

(declare-fun m!982215 () Bool)

(assert (=> b!1063059 m!982215))

(declare-fun m!982217 () Bool)

(assert (=> start!94112 m!982217))

(declare-fun m!982219 () Bool)

(assert (=> start!94112 m!982219))

(declare-fun m!982221 () Bool)

(assert (=> start!94112 m!982221))

(declare-fun m!982223 () Bool)

(assert (=> b!1063058 m!982223))

(check-sat (not mapNonEmpty!39409) (not start!94112) b_and!34073 (not b_next!21349) (not b!1063059) (not b!1063054) tp_is_empty!25159 (not b!1063058))
(check-sat b_and!34073 (not b_next!21349))
(get-model)

(declare-fun b!1063112 () Bool)

(declare-fun e!605550 () Bool)

(declare-fun e!605547 () Bool)

(assert (=> b!1063112 (= e!605550 e!605547)))

(declare-fun res!709541 () Bool)

(assert (=> b!1063112 (=> (not res!709541) (not e!605547))))

(declare-fun e!605548 () Bool)

(assert (=> b!1063112 (= res!709541 (not e!605548))))

(declare-fun res!709543 () Bool)

(assert (=> b!1063112 (=> (not res!709543) (not e!605548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1063112 (= res!709543 (validKeyInArray!0 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1063113 () Bool)

(declare-fun e!605549 () Bool)

(assert (=> b!1063113 (= e!605547 e!605549)))

(declare-fun c!107630 () Bool)

(assert (=> b!1063113 (= c!107630 (validKeyInArray!0 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129291 () Bool)

(declare-fun res!709542 () Bool)

(assert (=> d!129291 (=> res!709542 e!605550)))

(assert (=> d!129291 (= res!709542 (bvsge #b00000000000000000000000000000000 (size!32924 _keys!1163)))))

(assert (=> d!129291 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22539) e!605550)))

(declare-fun b!1063114 () Bool)

(declare-fun contains!6242 (List!22542 (_ BitVec 64)) Bool)

(assert (=> b!1063114 (= e!605548 (contains!6242 Nil!22539 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1063115 () Bool)

(declare-fun call!44969 () Bool)

(assert (=> b!1063115 (= e!605549 call!44969)))

(declare-fun b!1063116 () Bool)

(assert (=> b!1063116 (= e!605549 call!44969)))

(declare-fun bm!44966 () Bool)

(assert (=> bm!44966 (= call!44969 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107630 (Cons!22538 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000) Nil!22539) Nil!22539)))))

(assert (= (and d!129291 (not res!709542)) b!1063112))

(assert (= (and b!1063112 res!709543) b!1063114))

(assert (= (and b!1063112 res!709541) b!1063113))

(assert (= (and b!1063113 c!107630) b!1063115))

(assert (= (and b!1063113 (not c!107630)) b!1063116))

(assert (= (or b!1063115 b!1063116) bm!44966))

(declare-fun m!982261 () Bool)

(assert (=> b!1063112 m!982261))

(assert (=> b!1063112 m!982261))

(declare-fun m!982263 () Bool)

(assert (=> b!1063112 m!982263))

(assert (=> b!1063113 m!982261))

(assert (=> b!1063113 m!982261))

(assert (=> b!1063113 m!982263))

(assert (=> b!1063114 m!982261))

(assert (=> b!1063114 m!982261))

(declare-fun m!982265 () Bool)

(assert (=> b!1063114 m!982265))

(assert (=> bm!44966 m!982261))

(declare-fun m!982267 () Bool)

(assert (=> bm!44966 m!982267))

(assert (=> b!1063059 d!129291))

(declare-fun d!129293 () Bool)

(assert (=> d!129293 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94112 d!129293))

(declare-fun d!129295 () Bool)

(assert (=> d!129295 (= (array_inv!25110 _values!955) (bvsge (size!32923 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94112 d!129295))

(declare-fun d!129297 () Bool)

(assert (=> d!129297 (= (array_inv!25111 _keys!1163) (bvsge (size!32924 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94112 d!129297))

(declare-fun b!1063125 () Bool)

(declare-fun e!605557 () Bool)

(declare-fun call!44972 () Bool)

(assert (=> b!1063125 (= e!605557 call!44972)))

(declare-fun b!1063126 () Bool)

(declare-fun e!605558 () Bool)

(assert (=> b!1063126 (= e!605557 e!605558)))

(declare-fun lt!468264 () (_ BitVec 64))

(assert (=> b!1063126 (= lt!468264 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468263 () Unit!34767)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67371 (_ BitVec 64) (_ BitVec 32)) Unit!34767)

(assert (=> b!1063126 (= lt!468263 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!468264 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1063126 (arrayContainsKey!0 _keys!1163 lt!468264 #b00000000000000000000000000000000)))

(declare-fun lt!468262 () Unit!34767)

(assert (=> b!1063126 (= lt!468262 lt!468263)))

(declare-fun res!709548 () Bool)

(declare-datatypes ((SeekEntryResult!9827 0))(
  ( (MissingZero!9827 (index!41679 (_ BitVec 32))) (Found!9827 (index!41680 (_ BitVec 32))) (Intermediate!9827 (undefined!10639 Bool) (index!41681 (_ BitVec 32)) (x!94964 (_ BitVec 32))) (Undefined!9827) (MissingVacant!9827 (index!41682 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67371 (_ BitVec 32)) SeekEntryResult!9827)

(assert (=> b!1063126 (= res!709548 (= (seekEntryOrOpen!0 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9827 #b00000000000000000000000000000000)))))

(assert (=> b!1063126 (=> (not res!709548) (not e!605558))))

(declare-fun d!129299 () Bool)

(declare-fun res!709549 () Bool)

(declare-fun e!605559 () Bool)

(assert (=> d!129299 (=> res!709549 e!605559)))

(assert (=> d!129299 (= res!709549 (bvsge #b00000000000000000000000000000000 (size!32924 _keys!1163)))))

(assert (=> d!129299 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!605559)))

(declare-fun bm!44969 () Bool)

(assert (=> bm!44969 (= call!44972 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1063127 () Bool)

(assert (=> b!1063127 (= e!605559 e!605557)))

(declare-fun c!107633 () Bool)

(assert (=> b!1063127 (= c!107633 (validKeyInArray!0 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1063128 () Bool)

(assert (=> b!1063128 (= e!605558 call!44972)))

(assert (= (and d!129299 (not res!709549)) b!1063127))

(assert (= (and b!1063127 c!107633) b!1063126))

(assert (= (and b!1063127 (not c!107633)) b!1063125))

(assert (= (and b!1063126 res!709548) b!1063128))

(assert (= (or b!1063128 b!1063125) bm!44969))

(assert (=> b!1063126 m!982261))

(declare-fun m!982269 () Bool)

(assert (=> b!1063126 m!982269))

(declare-fun m!982271 () Bool)

(assert (=> b!1063126 m!982271))

(assert (=> b!1063126 m!982261))

(declare-fun m!982273 () Bool)

(assert (=> b!1063126 m!982273))

(declare-fun m!982275 () Bool)

(assert (=> bm!44969 m!982275))

(assert (=> b!1063127 m!982261))

(assert (=> b!1063127 m!982261))

(assert (=> b!1063127 m!982263))

(assert (=> b!1063058 d!129299))

(declare-fun d!129301 () Bool)

(assert (=> d!129301 (= (getCurrentListMapNoExtraKeys!3629 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3629 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468267 () Unit!34767)

(declare-fun choose!1727 (array!67371 array!67369 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38681 V!38681 V!38681 V!38681 (_ BitVec 32) Int) Unit!34767)

(assert (=> d!129301 (= lt!468267 (choose!1727 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129301 (validMask!0 mask!1515)))

(assert (=> d!129301 (= (lemmaNoChangeToArrayThenSameMapNoExtras!632 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468267)))

(declare-fun bs!31230 () Bool)

(assert (= bs!31230 d!129301))

(assert (=> bs!31230 m!982211))

(assert (=> bs!31230 m!982209))

(declare-fun m!982277 () Bool)

(assert (=> bs!31230 m!982277))

(assert (=> bs!31230 m!982217))

(assert (=> b!1063054 d!129301))

(declare-fun b!1063153 () Bool)

(declare-fun e!605575 () Bool)

(declare-fun e!605580 () Bool)

(assert (=> b!1063153 (= e!605575 e!605580)))

(declare-fun c!107643 () Bool)

(assert (=> b!1063153 (= c!107643 (bvslt #b00000000000000000000000000000000 (size!32924 _keys!1163)))))

(declare-fun b!1063154 () Bool)

(declare-fun lt!468288 () Unit!34767)

(declare-fun lt!468282 () Unit!34767)

(assert (=> b!1063154 (= lt!468288 lt!468282)))

(declare-fun lt!468284 () (_ BitVec 64))

(declare-fun lt!468286 () (_ BitVec 64))

(declare-fun lt!468285 () ListLongMap!13931)

(declare-fun lt!468287 () V!38681)

(declare-fun contains!6243 (ListLongMap!13931 (_ BitVec 64)) Bool)

(declare-fun +!3138 (ListLongMap!13931 tuple2!15954) ListLongMap!13931)

(assert (=> b!1063154 (not (contains!6243 (+!3138 lt!468285 (tuple2!15955 lt!468286 lt!468287)) lt!468284))))

(declare-fun addStillNotContains!248 (ListLongMap!13931 (_ BitVec 64) V!38681 (_ BitVec 64)) Unit!34767)

(assert (=> b!1063154 (= lt!468282 (addStillNotContains!248 lt!468285 lt!468286 lt!468287 lt!468284))))

(assert (=> b!1063154 (= lt!468284 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!16959 (ValueCell!11876 V!38681) V!38681)

(declare-fun dynLambda!2042 (Int (_ BitVec 64)) V!38681)

(assert (=> b!1063154 (= lt!468287 (get!16959 (select (arr!32386 _values!955) #b00000000000000000000000000000000) (dynLambda!2042 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1063154 (= lt!468286 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!44975 () ListLongMap!13931)

(assert (=> b!1063154 (= lt!468285 call!44975)))

(declare-fun e!605578 () ListLongMap!13931)

(assert (=> b!1063154 (= e!605578 (+!3138 call!44975 (tuple2!15955 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000) (get!16959 (select (arr!32386 _values!955) #b00000000000000000000000000000000) (dynLambda!2042 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1063155 () Bool)

(declare-fun res!709561 () Bool)

(declare-fun e!605576 () Bool)

(assert (=> b!1063155 (=> (not res!709561) (not e!605576))))

(declare-fun lt!468283 () ListLongMap!13931)

(assert (=> b!1063155 (= res!709561 (not (contains!6243 lt!468283 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1063156 () Bool)

(declare-fun e!605577 () ListLongMap!13931)

(assert (=> b!1063156 (= e!605577 (ListLongMap!13932 Nil!22538))))

(declare-fun b!1063157 () Bool)

(assert (=> b!1063157 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32924 _keys!1163)))))

(assert (=> b!1063157 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32923 _values!955)))))

(declare-fun e!605574 () Bool)

(declare-fun apply!927 (ListLongMap!13931 (_ BitVec 64)) V!38681)

(assert (=> b!1063157 (= e!605574 (= (apply!927 lt!468283 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000)) (get!16959 (select (arr!32386 _values!955) #b00000000000000000000000000000000) (dynLambda!2042 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!44972 () Bool)

(assert (=> bm!44972 (= call!44975 (getCurrentListMapNoExtraKeys!3629 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1063158 () Bool)

(assert (=> b!1063158 (= e!605578 call!44975)))

(declare-fun b!1063159 () Bool)

(assert (=> b!1063159 (= e!605577 e!605578)))

(declare-fun c!107645 () Bool)

(assert (=> b!1063159 (= c!107645 (validKeyInArray!0 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1063160 () Bool)

(assert (=> b!1063160 (= e!605576 e!605575)))

(declare-fun c!107644 () Bool)

(declare-fun e!605579 () Bool)

(assert (=> b!1063160 (= c!107644 e!605579)))

(declare-fun res!709560 () Bool)

(assert (=> b!1063160 (=> (not res!709560) (not e!605579))))

(assert (=> b!1063160 (= res!709560 (bvslt #b00000000000000000000000000000000 (size!32924 _keys!1163)))))

(declare-fun b!1063161 () Bool)

(assert (=> b!1063161 (= e!605579 (validKeyInArray!0 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1063161 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1063162 () Bool)

(assert (=> b!1063162 (= e!605580 (= lt!468283 (getCurrentListMapNoExtraKeys!3629 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun d!129303 () Bool)

(assert (=> d!129303 e!605576))

(declare-fun res!709559 () Bool)

(assert (=> d!129303 (=> (not res!709559) (not e!605576))))

(assert (=> d!129303 (= res!709559 (not (contains!6243 lt!468283 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129303 (= lt!468283 e!605577)))

(declare-fun c!107642 () Bool)

(assert (=> d!129303 (= c!107642 (bvsge #b00000000000000000000000000000000 (size!32924 _keys!1163)))))

(assert (=> d!129303 (validMask!0 mask!1515)))

(assert (=> d!129303 (= (getCurrentListMapNoExtraKeys!3629 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468283)))

(declare-fun b!1063163 () Bool)

(assert (=> b!1063163 (= e!605575 e!605574)))

(assert (=> b!1063163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32924 _keys!1163)))))

(declare-fun res!709558 () Bool)

(assert (=> b!1063163 (= res!709558 (contains!6243 lt!468283 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1063163 (=> (not res!709558) (not e!605574))))

(declare-fun b!1063164 () Bool)

(declare-fun isEmpty!940 (ListLongMap!13931) Bool)

(assert (=> b!1063164 (= e!605580 (isEmpty!940 lt!468283))))

(assert (= (and d!129303 c!107642) b!1063156))

(assert (= (and d!129303 (not c!107642)) b!1063159))

(assert (= (and b!1063159 c!107645) b!1063154))

(assert (= (and b!1063159 (not c!107645)) b!1063158))

(assert (= (or b!1063154 b!1063158) bm!44972))

(assert (= (and d!129303 res!709559) b!1063155))

(assert (= (and b!1063155 res!709561) b!1063160))

(assert (= (and b!1063160 res!709560) b!1063161))

(assert (= (and b!1063160 c!107644) b!1063163))

(assert (= (and b!1063160 (not c!107644)) b!1063153))

(assert (= (and b!1063163 res!709558) b!1063157))

(assert (= (and b!1063153 c!107643) b!1063162))

(assert (= (and b!1063153 (not c!107643)) b!1063164))

(declare-fun b_lambda!16455 () Bool)

(assert (=> (not b_lambda!16455) (not b!1063154)))

(declare-fun t!31847 () Bool)

(declare-fun tb!7123 () Bool)

(assert (=> (and start!94112 (= defaultEntry!963 defaultEntry!963) t!31847) tb!7123))

(declare-fun result!14693 () Bool)

(assert (=> tb!7123 (= result!14693 tp_is_empty!25159)))

(assert (=> b!1063154 t!31847))

(declare-fun b_and!34079 () Bool)

(assert (= b_and!34073 (and (=> t!31847 result!14693) b_and!34079)))

(declare-fun b_lambda!16457 () Bool)

(assert (=> (not b_lambda!16457) (not b!1063157)))

(assert (=> b!1063157 t!31847))

(declare-fun b_and!34081 () Bool)

(assert (= b_and!34079 (and (=> t!31847 result!14693) b_and!34081)))

(declare-fun m!982279 () Bool)

(assert (=> b!1063164 m!982279))

(declare-fun m!982281 () Bool)

(assert (=> b!1063154 m!982281))

(declare-fun m!982283 () Bool)

(assert (=> b!1063154 m!982283))

(declare-fun m!982285 () Bool)

(assert (=> b!1063154 m!982285))

(declare-fun m!982287 () Bool)

(assert (=> b!1063154 m!982287))

(assert (=> b!1063154 m!982283))

(declare-fun m!982289 () Bool)

(assert (=> b!1063154 m!982289))

(assert (=> b!1063154 m!982281))

(declare-fun m!982291 () Bool)

(assert (=> b!1063154 m!982291))

(assert (=> b!1063154 m!982261))

(assert (=> b!1063154 m!982289))

(declare-fun m!982293 () Bool)

(assert (=> b!1063154 m!982293))

(assert (=> b!1063157 m!982281))

(assert (=> b!1063157 m!982283))

(assert (=> b!1063157 m!982285))

(assert (=> b!1063157 m!982261))

(declare-fun m!982295 () Bool)

(assert (=> b!1063157 m!982295))

(assert (=> b!1063157 m!982261))

(assert (=> b!1063157 m!982283))

(assert (=> b!1063157 m!982281))

(declare-fun m!982297 () Bool)

(assert (=> d!129303 m!982297))

(assert (=> d!129303 m!982217))

(declare-fun m!982299 () Bool)

(assert (=> bm!44972 m!982299))

(assert (=> b!1063163 m!982261))

(assert (=> b!1063163 m!982261))

(declare-fun m!982301 () Bool)

(assert (=> b!1063163 m!982301))

(assert (=> b!1063159 m!982261))

(assert (=> b!1063159 m!982261))

(assert (=> b!1063159 m!982263))

(declare-fun m!982303 () Bool)

(assert (=> b!1063155 m!982303))

(assert (=> b!1063162 m!982299))

(assert (=> b!1063161 m!982261))

(assert (=> b!1063161 m!982261))

(assert (=> b!1063161 m!982263))

(assert (=> b!1063054 d!129303))

(declare-fun b!1063167 () Bool)

(declare-fun e!605582 () Bool)

(declare-fun e!605587 () Bool)

(assert (=> b!1063167 (= e!605582 e!605587)))

(declare-fun c!107647 () Bool)

(assert (=> b!1063167 (= c!107647 (bvslt #b00000000000000000000000000000000 (size!32924 _keys!1163)))))

(declare-fun b!1063168 () Bool)

(declare-fun lt!468295 () Unit!34767)

(declare-fun lt!468289 () Unit!34767)

(assert (=> b!1063168 (= lt!468295 lt!468289)))

(declare-fun lt!468294 () V!38681)

(declare-fun lt!468292 () ListLongMap!13931)

(declare-fun lt!468293 () (_ BitVec 64))

(declare-fun lt!468291 () (_ BitVec 64))

(assert (=> b!1063168 (not (contains!6243 (+!3138 lt!468292 (tuple2!15955 lt!468293 lt!468294)) lt!468291))))

(assert (=> b!1063168 (= lt!468289 (addStillNotContains!248 lt!468292 lt!468293 lt!468294 lt!468291))))

(assert (=> b!1063168 (= lt!468291 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1063168 (= lt!468294 (get!16959 (select (arr!32386 _values!955) #b00000000000000000000000000000000) (dynLambda!2042 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1063168 (= lt!468293 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!44976 () ListLongMap!13931)

(assert (=> b!1063168 (= lt!468292 call!44976)))

(declare-fun e!605585 () ListLongMap!13931)

(assert (=> b!1063168 (= e!605585 (+!3138 call!44976 (tuple2!15955 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000) (get!16959 (select (arr!32386 _values!955) #b00000000000000000000000000000000) (dynLambda!2042 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1063169 () Bool)

(declare-fun res!709565 () Bool)

(declare-fun e!605583 () Bool)

(assert (=> b!1063169 (=> (not res!709565) (not e!605583))))

(declare-fun lt!468290 () ListLongMap!13931)

(assert (=> b!1063169 (= res!709565 (not (contains!6243 lt!468290 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1063170 () Bool)

(declare-fun e!605584 () ListLongMap!13931)

(assert (=> b!1063170 (= e!605584 (ListLongMap!13932 Nil!22538))))

(declare-fun b!1063171 () Bool)

(assert (=> b!1063171 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32924 _keys!1163)))))

(assert (=> b!1063171 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32923 _values!955)))))

(declare-fun e!605581 () Bool)

(assert (=> b!1063171 (= e!605581 (= (apply!927 lt!468290 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000)) (get!16959 (select (arr!32386 _values!955) #b00000000000000000000000000000000) (dynLambda!2042 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!44973 () Bool)

(assert (=> bm!44973 (= call!44976 (getCurrentListMapNoExtraKeys!3629 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1063172 () Bool)

(assert (=> b!1063172 (= e!605585 call!44976)))

(declare-fun b!1063173 () Bool)

(assert (=> b!1063173 (= e!605584 e!605585)))

(declare-fun c!107649 () Bool)

(assert (=> b!1063173 (= c!107649 (validKeyInArray!0 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1063174 () Bool)

(assert (=> b!1063174 (= e!605583 e!605582)))

(declare-fun c!107648 () Bool)

(declare-fun e!605586 () Bool)

(assert (=> b!1063174 (= c!107648 e!605586)))

(declare-fun res!709564 () Bool)

(assert (=> b!1063174 (=> (not res!709564) (not e!605586))))

(assert (=> b!1063174 (= res!709564 (bvslt #b00000000000000000000000000000000 (size!32924 _keys!1163)))))

(declare-fun b!1063175 () Bool)

(assert (=> b!1063175 (= e!605586 (validKeyInArray!0 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1063175 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1063176 () Bool)

(assert (=> b!1063176 (= e!605587 (= lt!468290 (getCurrentListMapNoExtraKeys!3629 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun d!129305 () Bool)

(assert (=> d!129305 e!605583))

(declare-fun res!709563 () Bool)

(assert (=> d!129305 (=> (not res!709563) (not e!605583))))

(assert (=> d!129305 (= res!709563 (not (contains!6243 lt!468290 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129305 (= lt!468290 e!605584)))

(declare-fun c!107646 () Bool)

(assert (=> d!129305 (= c!107646 (bvsge #b00000000000000000000000000000000 (size!32924 _keys!1163)))))

(assert (=> d!129305 (validMask!0 mask!1515)))

(assert (=> d!129305 (= (getCurrentListMapNoExtraKeys!3629 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468290)))

(declare-fun b!1063177 () Bool)

(assert (=> b!1063177 (= e!605582 e!605581)))

(assert (=> b!1063177 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32924 _keys!1163)))))

(declare-fun res!709562 () Bool)

(assert (=> b!1063177 (= res!709562 (contains!6243 lt!468290 (select (arr!32387 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1063177 (=> (not res!709562) (not e!605581))))

(declare-fun b!1063178 () Bool)

(assert (=> b!1063178 (= e!605587 (isEmpty!940 lt!468290))))

(assert (= (and d!129305 c!107646) b!1063170))

(assert (= (and d!129305 (not c!107646)) b!1063173))

(assert (= (and b!1063173 c!107649) b!1063168))

(assert (= (and b!1063173 (not c!107649)) b!1063172))

(assert (= (or b!1063168 b!1063172) bm!44973))

(assert (= (and d!129305 res!709563) b!1063169))

(assert (= (and b!1063169 res!709565) b!1063174))

(assert (= (and b!1063174 res!709564) b!1063175))

(assert (= (and b!1063174 c!107648) b!1063177))

(assert (= (and b!1063174 (not c!107648)) b!1063167))

(assert (= (and b!1063177 res!709562) b!1063171))

(assert (= (and b!1063167 c!107647) b!1063176))

(assert (= (and b!1063167 (not c!107647)) b!1063178))

(declare-fun b_lambda!16459 () Bool)

(assert (=> (not b_lambda!16459) (not b!1063168)))

(assert (=> b!1063168 t!31847))

(declare-fun b_and!34083 () Bool)

(assert (= b_and!34081 (and (=> t!31847 result!14693) b_and!34083)))

(declare-fun b_lambda!16461 () Bool)

(assert (=> (not b_lambda!16461) (not b!1063171)))

(assert (=> b!1063171 t!31847))

(declare-fun b_and!34085 () Bool)

(assert (= b_and!34083 (and (=> t!31847 result!14693) b_and!34085)))

(declare-fun m!982305 () Bool)

(assert (=> b!1063178 m!982305))

(assert (=> b!1063168 m!982281))

(assert (=> b!1063168 m!982283))

(assert (=> b!1063168 m!982285))

(declare-fun m!982307 () Bool)

(assert (=> b!1063168 m!982307))

(assert (=> b!1063168 m!982283))

(declare-fun m!982309 () Bool)

(assert (=> b!1063168 m!982309))

(assert (=> b!1063168 m!982281))

(declare-fun m!982311 () Bool)

(assert (=> b!1063168 m!982311))

(assert (=> b!1063168 m!982261))

(assert (=> b!1063168 m!982309))

(declare-fun m!982313 () Bool)

(assert (=> b!1063168 m!982313))

(assert (=> b!1063171 m!982281))

(assert (=> b!1063171 m!982283))

(assert (=> b!1063171 m!982285))

(assert (=> b!1063171 m!982261))

(declare-fun m!982315 () Bool)

(assert (=> b!1063171 m!982315))

(assert (=> b!1063171 m!982261))

(assert (=> b!1063171 m!982283))

(assert (=> b!1063171 m!982281))

(declare-fun m!982317 () Bool)

(assert (=> d!129305 m!982317))

(assert (=> d!129305 m!982217))

(declare-fun m!982319 () Bool)

(assert (=> bm!44973 m!982319))

(assert (=> b!1063177 m!982261))

(assert (=> b!1063177 m!982261))

(declare-fun m!982321 () Bool)

(assert (=> b!1063177 m!982321))

(assert (=> b!1063173 m!982261))

(assert (=> b!1063173 m!982261))

(assert (=> b!1063173 m!982263))

(declare-fun m!982323 () Bool)

(assert (=> b!1063169 m!982323))

(assert (=> b!1063176 m!982319))

(assert (=> b!1063175 m!982261))

(assert (=> b!1063175 m!982261))

(assert (=> b!1063175 m!982263))

(assert (=> b!1063054 d!129305))

(declare-fun b!1063186 () Bool)

(declare-fun e!605593 () Bool)

(assert (=> b!1063186 (= e!605593 tp_is_empty!25159)))

(declare-fun mapIsEmpty!39418 () Bool)

(declare-fun mapRes!39418 () Bool)

(assert (=> mapIsEmpty!39418 mapRes!39418))

(declare-fun condMapEmpty!39418 () Bool)

(declare-fun mapDefault!39418 () ValueCell!11876)

(assert (=> mapNonEmpty!39409 (= condMapEmpty!39418 (= mapRest!39409 ((as const (Array (_ BitVec 32) ValueCell!11876)) mapDefault!39418)))))

(assert (=> mapNonEmpty!39409 (= tp!75469 (and e!605593 mapRes!39418))))

(declare-fun mapNonEmpty!39418 () Bool)

(declare-fun tp!75485 () Bool)

(declare-fun e!605592 () Bool)

(assert (=> mapNonEmpty!39418 (= mapRes!39418 (and tp!75485 e!605592))))

(declare-fun mapKey!39418 () (_ BitVec 32))

(declare-fun mapRest!39418 () (Array (_ BitVec 32) ValueCell!11876))

(declare-fun mapValue!39418 () ValueCell!11876)

(assert (=> mapNonEmpty!39418 (= mapRest!39409 (store mapRest!39418 mapKey!39418 mapValue!39418))))

(declare-fun b!1063185 () Bool)

(assert (=> b!1063185 (= e!605592 tp_is_empty!25159)))

(assert (= (and mapNonEmpty!39409 condMapEmpty!39418) mapIsEmpty!39418))

(assert (= (and mapNonEmpty!39409 (not condMapEmpty!39418)) mapNonEmpty!39418))

(assert (= (and mapNonEmpty!39418 ((_ is ValueCellFull!11876) mapValue!39418)) b!1063185))

(assert (= (and mapNonEmpty!39409 ((_ is ValueCellFull!11876) mapDefault!39418)) b!1063186))

(declare-fun m!982325 () Bool)

(assert (=> mapNonEmpty!39418 m!982325))

(declare-fun b_lambda!16463 () Bool)

(assert (= b_lambda!16459 (or (and start!94112 b_free!21349) b_lambda!16463)))

(declare-fun b_lambda!16465 () Bool)

(assert (= b_lambda!16461 (or (and start!94112 b_free!21349) b_lambda!16465)))

(declare-fun b_lambda!16467 () Bool)

(assert (= b_lambda!16455 (or (and start!94112 b_free!21349) b_lambda!16467)))

(declare-fun b_lambda!16469 () Bool)

(assert (= b_lambda!16457 (or (and start!94112 b_free!21349) b_lambda!16469)))

(check-sat (not bm!44972) (not b_lambda!16467) (not b!1063163) b_and!34085 (not b!1063164) (not b_lambda!16469) (not bm!44966) (not b!1063114) (not b!1063127) (not mapNonEmpty!39418) (not bm!44973) (not b!1063162) tp_is_empty!25159 (not b_lambda!16463) (not b!1063173) (not b!1063157) (not bm!44969) (not b!1063178) (not b_lambda!16465) (not b!1063112) (not b!1063155) (not b!1063176) (not b_next!21349) (not d!129301) (not b!1063113) (not b!1063154) (not d!129305) (not b!1063168) (not b!1063171) (not b!1063126) (not b!1063169) (not b!1063161) (not b!1063159) (not b!1063175) (not b!1063177) (not d!129303))
(check-sat b_and!34085 (not b_next!21349))
