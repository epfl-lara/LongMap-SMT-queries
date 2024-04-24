; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70692 () Bool)

(assert start!70692)

(declare-fun b_free!12853 () Bool)

(declare-fun b_next!12853 () Bool)

(assert (=> start!70692 (= b_free!12853 (not b_next!12853))))

(declare-fun tp!45292 () Bool)

(declare-fun b_and!21693 () Bool)

(assert (=> start!70692 (= tp!45292 b_and!21693)))

(declare-fun mapIsEmpty!23443 () Bool)

(declare-fun mapRes!23443 () Bool)

(assert (=> mapIsEmpty!23443 mapRes!23443))

(declare-fun b!820169 () Bool)

(declare-fun e!455535 () Bool)

(declare-fun e!455536 () Bool)

(assert (=> b!820169 (= e!455535 (not e!455536))))

(declare-fun res!559429 () Bool)

(assert (=> b!820169 (=> res!559429 e!455536)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820169 (= res!559429 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24419 0))(
  ( (V!24420 (val!7329 Int)) )
))
(declare-datatypes ((tuple2!9556 0))(
  ( (tuple2!9557 (_1!4789 (_ BitVec 64)) (_2!4789 V!24419)) )
))
(declare-datatypes ((List!15360 0))(
  ( (Nil!15357) (Cons!15356 (h!16491 tuple2!9556) (t!21681 List!15360)) )
))
(declare-datatypes ((ListLongMap!8381 0))(
  ( (ListLongMap!8382 (toList!4206 List!15360)) )
))
(declare-fun lt!367938 () ListLongMap!8381)

(declare-fun lt!367937 () ListLongMap!8381)

(assert (=> b!820169 (= lt!367938 lt!367937)))

(declare-fun zeroValueBefore!34 () V!24419)

(declare-datatypes ((Unit!27960 0))(
  ( (Unit!27961) )
))
(declare-fun lt!367942 () Unit!27960)

(declare-datatypes ((array!45325 0))(
  ( (array!45326 (arr!21712 (Array (_ BitVec 32) (_ BitVec 64))) (size!22132 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45325)

(declare-fun zeroValueAfter!34 () V!24419)

(declare-fun minValue!754 () V!24419)

(declare-datatypes ((ValueCell!6866 0))(
  ( (ValueCellFull!6866 (v!9758 V!24419)) (EmptyCell!6866) )
))
(declare-datatypes ((array!45327 0))(
  ( (array!45328 (arr!21713 (Array (_ BitVec 32) ValueCell!6866)) (size!22133 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45327)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!389 (array!45325 array!45327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24419 V!24419 V!24419 V!24419 (_ BitVec 32) Int) Unit!27960)

(assert (=> b!820169 (= lt!367942 (lemmaNoChangeToArrayThenSameMapNoExtras!389 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2301 (array!45325 array!45327 (_ BitVec 32) (_ BitVec 32) V!24419 V!24419 (_ BitVec 32) Int) ListLongMap!8381)

(assert (=> b!820169 (= lt!367937 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820169 (= lt!367938 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820170 () Bool)

(declare-fun e!455529 () Bool)

(declare-fun tp_is_empty!14563 () Bool)

(assert (=> b!820170 (= e!455529 tp_is_empty!14563)))

(declare-fun mapNonEmpty!23443 () Bool)

(declare-fun tp!45291 () Bool)

(assert (=> mapNonEmpty!23443 (= mapRes!23443 (and tp!45291 e!455529))))

(declare-fun mapRest!23443 () (Array (_ BitVec 32) ValueCell!6866))

(declare-fun mapKey!23443 () (_ BitVec 32))

(declare-fun mapValue!23443 () ValueCell!6866)

(assert (=> mapNonEmpty!23443 (= (arr!21713 _values!788) (store mapRest!23443 mapKey!23443 mapValue!23443))))

(declare-fun b!820171 () Bool)

(declare-fun e!455534 () Bool)

(assert (=> b!820171 (= e!455536 e!455534)))

(declare-fun res!559430 () Bool)

(assert (=> b!820171 (=> res!559430 e!455534)))

(declare-fun lt!367941 () ListLongMap!8381)

(declare-fun lt!367935 () tuple2!9556)

(declare-fun lt!367936 () tuple2!9556)

(declare-fun +!1843 (ListLongMap!8381 tuple2!9556) ListLongMap!8381)

(assert (=> b!820171 (= res!559430 (not (= lt!367941 (+!1843 (+!1843 lt!367937 lt!367935) lt!367936))))))

(declare-fun lt!367940 () ListLongMap!8381)

(assert (=> b!820171 (= (+!1843 lt!367938 lt!367936) (+!1843 lt!367940 lt!367936))))

(declare-fun lt!367943 () Unit!27960)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!181 (ListLongMap!8381 (_ BitVec 64) V!24419 V!24419) Unit!27960)

(assert (=> b!820171 (= lt!367943 (addSameAsAddTwiceSameKeyDiffValues!181 lt!367938 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!820171 (= lt!367936 (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455530 () Bool)

(assert (=> b!820171 e!455530))

(declare-fun res!559432 () Bool)

(assert (=> b!820171 (=> (not res!559432) (not e!455530))))

(declare-fun lt!367939 () ListLongMap!8381)

(assert (=> b!820171 (= res!559432 (= lt!367939 lt!367940))))

(assert (=> b!820171 (= lt!367940 (+!1843 lt!367938 lt!367935))))

(assert (=> b!820171 (= lt!367935 (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2394 (array!45325 array!45327 (_ BitVec 32) (_ BitVec 32) V!24419 V!24419 (_ BitVec 32) Int) ListLongMap!8381)

(assert (=> b!820171 (= lt!367941 (getCurrentListMap!2394 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820171 (= lt!367939 (getCurrentListMap!2394 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820172 () Bool)

(declare-fun res!559434 () Bool)

(assert (=> b!820172 (=> (not res!559434) (not e!455535))))

(assert (=> b!820172 (= res!559434 (and (= (size!22133 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22132 _keys!976) (size!22133 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!559433 () Bool)

(assert (=> start!70692 (=> (not res!559433) (not e!455535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70692 (= res!559433 (validMask!0 mask!1312))))

(assert (=> start!70692 e!455535))

(assert (=> start!70692 tp_is_empty!14563))

(declare-fun array_inv!17385 (array!45325) Bool)

(assert (=> start!70692 (array_inv!17385 _keys!976)))

(assert (=> start!70692 true))

(declare-fun e!455533 () Bool)

(declare-fun array_inv!17386 (array!45327) Bool)

(assert (=> start!70692 (and (array_inv!17386 _values!788) e!455533)))

(assert (=> start!70692 tp!45292))

(declare-fun b!820173 () Bool)

(assert (=> b!820173 (= e!455534 (bvsle #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(declare-fun b!820174 () Bool)

(assert (=> b!820174 (= e!455530 (= lt!367941 (+!1843 lt!367937 (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!820175 () Bool)

(declare-fun e!455532 () Bool)

(assert (=> b!820175 (= e!455533 (and e!455532 mapRes!23443))))

(declare-fun condMapEmpty!23443 () Bool)

(declare-fun mapDefault!23443 () ValueCell!6866)

(assert (=> b!820175 (= condMapEmpty!23443 (= (arr!21713 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6866)) mapDefault!23443)))))

(declare-fun b!820176 () Bool)

(declare-fun res!559435 () Bool)

(assert (=> b!820176 (=> (not res!559435) (not e!455535))))

(declare-datatypes ((List!15361 0))(
  ( (Nil!15358) (Cons!15357 (h!16492 (_ BitVec 64)) (t!21682 List!15361)) )
))
(declare-fun arrayNoDuplicates!0 (array!45325 (_ BitVec 32) List!15361) Bool)

(assert (=> b!820176 (= res!559435 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15358))))

(declare-fun b!820177 () Bool)

(declare-fun res!559431 () Bool)

(assert (=> b!820177 (=> (not res!559431) (not e!455535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45325 (_ BitVec 32)) Bool)

(assert (=> b!820177 (= res!559431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820178 () Bool)

(assert (=> b!820178 (= e!455532 tp_is_empty!14563)))

(assert (= (and start!70692 res!559433) b!820172))

(assert (= (and b!820172 res!559434) b!820177))

(assert (= (and b!820177 res!559431) b!820176))

(assert (= (and b!820176 res!559435) b!820169))

(assert (= (and b!820169 (not res!559429)) b!820171))

(assert (= (and b!820171 res!559432) b!820174))

(assert (= (and b!820171 (not res!559430)) b!820173))

(assert (= (and b!820175 condMapEmpty!23443) mapIsEmpty!23443))

(assert (= (and b!820175 (not condMapEmpty!23443)) mapNonEmpty!23443))

(get-info :version)

(assert (= (and mapNonEmpty!23443 ((_ is ValueCellFull!6866) mapValue!23443)) b!820170))

(assert (= (and b!820175 ((_ is ValueCellFull!6866) mapDefault!23443)) b!820178))

(assert (= start!70692 b!820175))

(declare-fun m!762143 () Bool)

(assert (=> b!820169 m!762143))

(declare-fun m!762145 () Bool)

(assert (=> b!820169 m!762145))

(declare-fun m!762147 () Bool)

(assert (=> b!820169 m!762147))

(declare-fun m!762149 () Bool)

(assert (=> b!820177 m!762149))

(declare-fun m!762151 () Bool)

(assert (=> start!70692 m!762151))

(declare-fun m!762153 () Bool)

(assert (=> start!70692 m!762153))

(declare-fun m!762155 () Bool)

(assert (=> start!70692 m!762155))

(declare-fun m!762157 () Bool)

(assert (=> mapNonEmpty!23443 m!762157))

(declare-fun m!762159 () Bool)

(assert (=> b!820174 m!762159))

(declare-fun m!762161 () Bool)

(assert (=> b!820171 m!762161))

(declare-fun m!762163 () Bool)

(assert (=> b!820171 m!762163))

(declare-fun m!762165 () Bool)

(assert (=> b!820171 m!762165))

(assert (=> b!820171 m!762163))

(declare-fun m!762167 () Bool)

(assert (=> b!820171 m!762167))

(declare-fun m!762169 () Bool)

(assert (=> b!820171 m!762169))

(declare-fun m!762171 () Bool)

(assert (=> b!820171 m!762171))

(declare-fun m!762173 () Bool)

(assert (=> b!820171 m!762173))

(declare-fun m!762175 () Bool)

(assert (=> b!820171 m!762175))

(declare-fun m!762177 () Bool)

(assert (=> b!820176 m!762177))

(check-sat (not b!820171) b_and!21693 (not b!820177) tp_is_empty!14563 (not b!820174) (not mapNonEmpty!23443) (not start!70692) (not b!820169) (not b!820176) (not b_next!12853))
(check-sat b_and!21693 (not b_next!12853))
(get-model)

(declare-fun d!104973 () Bool)

(declare-fun e!455587 () Bool)

(assert (=> d!104973 e!455587))

(declare-fun res!559482 () Bool)

(assert (=> d!104973 (=> (not res!559482) (not e!455587))))

(declare-fun lt!368006 () ListLongMap!8381)

(declare-fun contains!4137 (ListLongMap!8381 (_ BitVec 64)) Bool)

(assert (=> d!104973 (= res!559482 (contains!4137 lt!368006 (_1!4789 lt!367935)))))

(declare-fun lt!368007 () List!15360)

(assert (=> d!104973 (= lt!368006 (ListLongMap!8382 lt!368007))))

(declare-fun lt!368009 () Unit!27960)

(declare-fun lt!368008 () Unit!27960)

(assert (=> d!104973 (= lt!368009 lt!368008)))

(declare-datatypes ((Option!409 0))(
  ( (Some!408 (v!9761 V!24419)) (None!407) )
))
(declare-fun getValueByKey!403 (List!15360 (_ BitVec 64)) Option!409)

(assert (=> d!104973 (= (getValueByKey!403 lt!368007 (_1!4789 lt!367935)) (Some!408 (_2!4789 lt!367935)))))

(declare-fun lemmaContainsTupThenGetReturnValue!217 (List!15360 (_ BitVec 64) V!24419) Unit!27960)

(assert (=> d!104973 (= lt!368008 (lemmaContainsTupThenGetReturnValue!217 lt!368007 (_1!4789 lt!367935) (_2!4789 lt!367935)))))

(declare-fun insertStrictlySorted!256 (List!15360 (_ BitVec 64) V!24419) List!15360)

(assert (=> d!104973 (= lt!368007 (insertStrictlySorted!256 (toList!4206 lt!367938) (_1!4789 lt!367935) (_2!4789 lt!367935)))))

(assert (=> d!104973 (= (+!1843 lt!367938 lt!367935) lt!368006)))

(declare-fun b!820243 () Bool)

(declare-fun res!559483 () Bool)

(assert (=> b!820243 (=> (not res!559483) (not e!455587))))

(assert (=> b!820243 (= res!559483 (= (getValueByKey!403 (toList!4206 lt!368006) (_1!4789 lt!367935)) (Some!408 (_2!4789 lt!367935))))))

(declare-fun b!820244 () Bool)

(declare-fun contains!4138 (List!15360 tuple2!9556) Bool)

(assert (=> b!820244 (= e!455587 (contains!4138 (toList!4206 lt!368006) lt!367935))))

(assert (= (and d!104973 res!559482) b!820243))

(assert (= (and b!820243 res!559483) b!820244))

(declare-fun m!762251 () Bool)

(assert (=> d!104973 m!762251))

(declare-fun m!762253 () Bool)

(assert (=> d!104973 m!762253))

(declare-fun m!762255 () Bool)

(assert (=> d!104973 m!762255))

(declare-fun m!762257 () Bool)

(assert (=> d!104973 m!762257))

(declare-fun m!762259 () Bool)

(assert (=> b!820243 m!762259))

(declare-fun m!762261 () Bool)

(assert (=> b!820244 m!762261))

(assert (=> b!820171 d!104973))

(declare-fun d!104975 () Bool)

(declare-fun e!455588 () Bool)

(assert (=> d!104975 e!455588))

(declare-fun res!559484 () Bool)

(assert (=> d!104975 (=> (not res!559484) (not e!455588))))

(declare-fun lt!368010 () ListLongMap!8381)

(assert (=> d!104975 (= res!559484 (contains!4137 lt!368010 (_1!4789 lt!367936)))))

(declare-fun lt!368011 () List!15360)

(assert (=> d!104975 (= lt!368010 (ListLongMap!8382 lt!368011))))

(declare-fun lt!368013 () Unit!27960)

(declare-fun lt!368012 () Unit!27960)

(assert (=> d!104975 (= lt!368013 lt!368012)))

(assert (=> d!104975 (= (getValueByKey!403 lt!368011 (_1!4789 lt!367936)) (Some!408 (_2!4789 lt!367936)))))

(assert (=> d!104975 (= lt!368012 (lemmaContainsTupThenGetReturnValue!217 lt!368011 (_1!4789 lt!367936) (_2!4789 lt!367936)))))

(assert (=> d!104975 (= lt!368011 (insertStrictlySorted!256 (toList!4206 lt!367940) (_1!4789 lt!367936) (_2!4789 lt!367936)))))

(assert (=> d!104975 (= (+!1843 lt!367940 lt!367936) lt!368010)))

(declare-fun b!820245 () Bool)

(declare-fun res!559485 () Bool)

(assert (=> b!820245 (=> (not res!559485) (not e!455588))))

(assert (=> b!820245 (= res!559485 (= (getValueByKey!403 (toList!4206 lt!368010) (_1!4789 lt!367936)) (Some!408 (_2!4789 lt!367936))))))

(declare-fun b!820246 () Bool)

(assert (=> b!820246 (= e!455588 (contains!4138 (toList!4206 lt!368010) lt!367936))))

(assert (= (and d!104975 res!559484) b!820245))

(assert (= (and b!820245 res!559485) b!820246))

(declare-fun m!762263 () Bool)

(assert (=> d!104975 m!762263))

(declare-fun m!762265 () Bool)

(assert (=> d!104975 m!762265))

(declare-fun m!762267 () Bool)

(assert (=> d!104975 m!762267))

(declare-fun m!762269 () Bool)

(assert (=> d!104975 m!762269))

(declare-fun m!762271 () Bool)

(assert (=> b!820245 m!762271))

(declare-fun m!762273 () Bool)

(assert (=> b!820246 m!762273))

(assert (=> b!820171 d!104975))

(declare-fun d!104977 () Bool)

(assert (=> d!104977 (= (+!1843 lt!367938 (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (+!1843 (+!1843 lt!367938 (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!368016 () Unit!27960)

(declare-fun choose!1399 (ListLongMap!8381 (_ BitVec 64) V!24419 V!24419) Unit!27960)

(assert (=> d!104977 (= lt!368016 (choose!1399 lt!367938 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> d!104977 (= (addSameAsAddTwiceSameKeyDiffValues!181 lt!367938 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34) lt!368016)))

(declare-fun bs!22854 () Bool)

(assert (= bs!22854 d!104977))

(declare-fun m!762275 () Bool)

(assert (=> bs!22854 m!762275))

(declare-fun m!762277 () Bool)

(assert (=> bs!22854 m!762277))

(assert (=> bs!22854 m!762277))

(declare-fun m!762279 () Bool)

(assert (=> bs!22854 m!762279))

(declare-fun m!762281 () Bool)

(assert (=> bs!22854 m!762281))

(assert (=> b!820171 d!104977))

(declare-fun d!104979 () Bool)

(declare-fun e!455624 () Bool)

(assert (=> d!104979 e!455624))

(declare-fun res!559504 () Bool)

(assert (=> d!104979 (=> (not res!559504) (not e!455624))))

(assert (=> d!104979 (= res!559504 (or (bvsge #b00000000000000000000000000000000 (size!22132 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))))

(declare-fun lt!368061 () ListLongMap!8381)

(declare-fun lt!368066 () ListLongMap!8381)

(assert (=> d!104979 (= lt!368061 lt!368066)))

(declare-fun lt!368062 () Unit!27960)

(declare-fun e!455625 () Unit!27960)

(assert (=> d!104979 (= lt!368062 e!455625)))

(declare-fun c!89413 () Bool)

(declare-fun e!455615 () Bool)

(assert (=> d!104979 (= c!89413 e!455615)))

(declare-fun res!559510 () Bool)

(assert (=> d!104979 (=> (not res!559510) (not e!455615))))

(assert (=> d!104979 (= res!559510 (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(declare-fun e!455627 () ListLongMap!8381)

(assert (=> d!104979 (= lt!368066 e!455627)))

(declare-fun c!89417 () Bool)

(assert (=> d!104979 (= c!89417 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104979 (validMask!0 mask!1312)))

(assert (=> d!104979 (= (getCurrentListMap!2394 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368061)))

(declare-fun b!820289 () Bool)

(declare-fun e!455620 () Bool)

(declare-fun call!35697 () Bool)

(assert (=> b!820289 (= e!455620 (not call!35697))))

(declare-fun b!820290 () Bool)

(declare-fun e!455617 () Bool)

(declare-fun apply!354 (ListLongMap!8381 (_ BitVec 64)) V!24419)

(assert (=> b!820290 (= e!455617 (= (apply!354 lt!368061 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!820291 () Bool)

(declare-fun e!455623 () Bool)

(assert (=> b!820291 (= e!455620 e!455623)))

(declare-fun res!559506 () Bool)

(assert (=> b!820291 (= res!559506 call!35697)))

(assert (=> b!820291 (=> (not res!559506) (not e!455623))))

(declare-fun bm!35693 () Bool)

(declare-fun call!35698 () ListLongMap!8381)

(declare-fun call!35700 () ListLongMap!8381)

(assert (=> bm!35693 (= call!35698 call!35700)))

(declare-fun b!820292 () Bool)

(declare-fun e!455619 () ListLongMap!8381)

(assert (=> b!820292 (= e!455619 call!35698)))

(declare-fun b!820293 () Bool)

(assert (=> b!820293 (= e!455627 (+!1843 call!35700 (tuple2!9557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!820294 () Bool)

(declare-fun Unit!27964 () Unit!27960)

(assert (=> b!820294 (= e!455625 Unit!27964)))

(declare-fun b!820295 () Bool)

(declare-fun e!455616 () ListLongMap!8381)

(assert (=> b!820295 (= e!455627 e!455616)))

(declare-fun c!89414 () Bool)

(assert (=> b!820295 (= c!89414 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35694 () Bool)

(declare-fun call!35701 () ListLongMap!8381)

(declare-fun call!35696 () ListLongMap!8381)

(assert (=> bm!35694 (= call!35701 call!35696)))

(declare-fun b!820296 () Bool)

(declare-fun e!455626 () Bool)

(assert (=> b!820296 (= e!455626 e!455617)))

(declare-fun res!559511 () Bool)

(declare-fun call!35702 () Bool)

(assert (=> b!820296 (= res!559511 call!35702)))

(assert (=> b!820296 (=> (not res!559511) (not e!455617))))

(declare-fun b!820297 () Bool)

(assert (=> b!820297 (= e!455616 call!35698)))

(declare-fun b!820298 () Bool)

(assert (=> b!820298 (= e!455624 e!455620)))

(declare-fun c!89412 () Bool)

(assert (=> b!820298 (= c!89412 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35695 () Bool)

(declare-fun call!35699 () ListLongMap!8381)

(assert (=> bm!35695 (= call!35700 (+!1843 (ite c!89417 call!35699 (ite c!89414 call!35696 call!35701)) (ite (or c!89417 c!89414) (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!820299 () Bool)

(declare-fun e!455618 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!820299 (= e!455618 (validKeyInArray!0 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820300 () Bool)

(declare-fun e!455622 () Bool)

(declare-fun e!455621 () Bool)

(assert (=> b!820300 (= e!455622 e!455621)))

(declare-fun res!559509 () Bool)

(assert (=> b!820300 (=> (not res!559509) (not e!455621))))

(assert (=> b!820300 (= res!559509 (contains!4137 lt!368061 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820300 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(declare-fun b!820301 () Bool)

(declare-fun get!11588 (ValueCell!6866 V!24419) V!24419)

(declare-fun dynLambda!962 (Int (_ BitVec 64)) V!24419)

(assert (=> b!820301 (= e!455621 (= (apply!354 lt!368061 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)) (get!11588 (select (arr!21713 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!820301 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22133 _values!788)))))

(assert (=> b!820301 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(declare-fun b!820302 () Bool)

(declare-fun res!559508 () Bool)

(assert (=> b!820302 (=> (not res!559508) (not e!455624))))

(assert (=> b!820302 (= res!559508 e!455626)))

(declare-fun c!89415 () Bool)

(assert (=> b!820302 (= c!89415 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!820303 () Bool)

(assert (=> b!820303 (= e!455623 (= (apply!354 lt!368061 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!820304 () Bool)

(declare-fun c!89416 () Bool)

(assert (=> b!820304 (= c!89416 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!820304 (= e!455616 e!455619)))

(declare-fun b!820305 () Bool)

(declare-fun lt!368081 () Unit!27960)

(assert (=> b!820305 (= e!455625 lt!368081)))

(declare-fun lt!368077 () ListLongMap!8381)

(assert (=> b!820305 (= lt!368077 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368063 () (_ BitVec 64))

(assert (=> b!820305 (= lt!368063 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368070 () (_ BitVec 64))

(assert (=> b!820305 (= lt!368070 (select (arr!21712 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368071 () Unit!27960)

(declare-fun addStillContains!308 (ListLongMap!8381 (_ BitVec 64) V!24419 (_ BitVec 64)) Unit!27960)

(assert (=> b!820305 (= lt!368071 (addStillContains!308 lt!368077 lt!368063 zeroValueBefore!34 lt!368070))))

(assert (=> b!820305 (contains!4137 (+!1843 lt!368077 (tuple2!9557 lt!368063 zeroValueBefore!34)) lt!368070)))

(declare-fun lt!368075 () Unit!27960)

(assert (=> b!820305 (= lt!368075 lt!368071)))

(declare-fun lt!368065 () ListLongMap!8381)

(assert (=> b!820305 (= lt!368065 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368074 () (_ BitVec 64))

(assert (=> b!820305 (= lt!368074 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368064 () (_ BitVec 64))

(assert (=> b!820305 (= lt!368064 (select (arr!21712 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368080 () Unit!27960)

(declare-fun addApplyDifferent!308 (ListLongMap!8381 (_ BitVec 64) V!24419 (_ BitVec 64)) Unit!27960)

(assert (=> b!820305 (= lt!368080 (addApplyDifferent!308 lt!368065 lt!368074 minValue!754 lt!368064))))

(assert (=> b!820305 (= (apply!354 (+!1843 lt!368065 (tuple2!9557 lt!368074 minValue!754)) lt!368064) (apply!354 lt!368065 lt!368064))))

(declare-fun lt!368072 () Unit!27960)

(assert (=> b!820305 (= lt!368072 lt!368080)))

(declare-fun lt!368076 () ListLongMap!8381)

(assert (=> b!820305 (= lt!368076 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368078 () (_ BitVec 64))

(assert (=> b!820305 (= lt!368078 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368082 () (_ BitVec 64))

(assert (=> b!820305 (= lt!368082 (select (arr!21712 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368073 () Unit!27960)

(assert (=> b!820305 (= lt!368073 (addApplyDifferent!308 lt!368076 lt!368078 zeroValueBefore!34 lt!368082))))

(assert (=> b!820305 (= (apply!354 (+!1843 lt!368076 (tuple2!9557 lt!368078 zeroValueBefore!34)) lt!368082) (apply!354 lt!368076 lt!368082))))

(declare-fun lt!368069 () Unit!27960)

(assert (=> b!820305 (= lt!368069 lt!368073)))

(declare-fun lt!368079 () ListLongMap!8381)

(assert (=> b!820305 (= lt!368079 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368068 () (_ BitVec 64))

(assert (=> b!820305 (= lt!368068 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368067 () (_ BitVec 64))

(assert (=> b!820305 (= lt!368067 (select (arr!21712 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!820305 (= lt!368081 (addApplyDifferent!308 lt!368079 lt!368068 minValue!754 lt!368067))))

(assert (=> b!820305 (= (apply!354 (+!1843 lt!368079 (tuple2!9557 lt!368068 minValue!754)) lt!368067) (apply!354 lt!368079 lt!368067))))

(declare-fun bm!35696 () Bool)

(assert (=> bm!35696 (= call!35699 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820306 () Bool)

(declare-fun res!559512 () Bool)

(assert (=> b!820306 (=> (not res!559512) (not e!455624))))

(assert (=> b!820306 (= res!559512 e!455622)))

(declare-fun res!559507 () Bool)

(assert (=> b!820306 (=> res!559507 e!455622)))

(assert (=> b!820306 (= res!559507 (not e!455618))))

(declare-fun res!559505 () Bool)

(assert (=> b!820306 (=> (not res!559505) (not e!455618))))

(assert (=> b!820306 (= res!559505 (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(declare-fun bm!35697 () Bool)

(assert (=> bm!35697 (= call!35702 (contains!4137 lt!368061 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!820307 () Bool)

(assert (=> b!820307 (= e!455626 (not call!35702))))

(declare-fun b!820308 () Bool)

(assert (=> b!820308 (= e!455615 (validKeyInArray!0 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820309 () Bool)

(assert (=> b!820309 (= e!455619 call!35701)))

(declare-fun bm!35698 () Bool)

(assert (=> bm!35698 (= call!35697 (contains!4137 lt!368061 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35699 () Bool)

(assert (=> bm!35699 (= call!35696 call!35699)))

(assert (= (and d!104979 c!89417) b!820293))

(assert (= (and d!104979 (not c!89417)) b!820295))

(assert (= (and b!820295 c!89414) b!820297))

(assert (= (and b!820295 (not c!89414)) b!820304))

(assert (= (and b!820304 c!89416) b!820292))

(assert (= (and b!820304 (not c!89416)) b!820309))

(assert (= (or b!820292 b!820309) bm!35694))

(assert (= (or b!820297 bm!35694) bm!35699))

(assert (= (or b!820297 b!820292) bm!35693))

(assert (= (or b!820293 bm!35699) bm!35696))

(assert (= (or b!820293 bm!35693) bm!35695))

(assert (= (and d!104979 res!559510) b!820308))

(assert (= (and d!104979 c!89413) b!820305))

(assert (= (and d!104979 (not c!89413)) b!820294))

(assert (= (and d!104979 res!559504) b!820306))

(assert (= (and b!820306 res!559505) b!820299))

(assert (= (and b!820306 (not res!559507)) b!820300))

(assert (= (and b!820300 res!559509) b!820301))

(assert (= (and b!820306 res!559512) b!820302))

(assert (= (and b!820302 c!89415) b!820296))

(assert (= (and b!820302 (not c!89415)) b!820307))

(assert (= (and b!820296 res!559511) b!820290))

(assert (= (or b!820296 b!820307) bm!35697))

(assert (= (and b!820302 res!559508) b!820298))

(assert (= (and b!820298 c!89412) b!820291))

(assert (= (and b!820298 (not c!89412)) b!820289))

(assert (= (and b!820291 res!559506) b!820303))

(assert (= (or b!820291 b!820289) bm!35698))

(declare-fun b_lambda!10961 () Bool)

(assert (=> (not b_lambda!10961) (not b!820301)))

(declare-fun t!21686 () Bool)

(declare-fun tb!4181 () Bool)

(assert (=> (and start!70692 (= defaultEntry!796 defaultEntry!796) t!21686) tb!4181))

(declare-fun result!7899 () Bool)

(assert (=> tb!4181 (= result!7899 tp_is_empty!14563)))

(assert (=> b!820301 t!21686))

(declare-fun b_and!21699 () Bool)

(assert (= b_and!21693 (and (=> t!21686 result!7899) b_and!21699)))

(assert (=> d!104979 m!762151))

(assert (=> bm!35696 m!762147))

(declare-fun m!762283 () Bool)

(assert (=> b!820303 m!762283))

(declare-fun m!762285 () Bool)

(assert (=> b!820308 m!762285))

(assert (=> b!820308 m!762285))

(declare-fun m!762287 () Bool)

(assert (=> b!820308 m!762287))

(declare-fun m!762289 () Bool)

(assert (=> b!820290 m!762289))

(assert (=> b!820300 m!762285))

(assert (=> b!820300 m!762285))

(declare-fun m!762291 () Bool)

(assert (=> b!820300 m!762291))

(declare-fun m!762293 () Bool)

(assert (=> b!820305 m!762293))

(assert (=> b!820305 m!762147))

(assert (=> b!820305 m!762285))

(declare-fun m!762295 () Bool)

(assert (=> b!820305 m!762295))

(declare-fun m!762297 () Bool)

(assert (=> b!820305 m!762297))

(declare-fun m!762299 () Bool)

(assert (=> b!820305 m!762299))

(declare-fun m!762301 () Bool)

(assert (=> b!820305 m!762301))

(declare-fun m!762303 () Bool)

(assert (=> b!820305 m!762303))

(declare-fun m!762305 () Bool)

(assert (=> b!820305 m!762305))

(declare-fun m!762307 () Bool)

(assert (=> b!820305 m!762307))

(assert (=> b!820305 m!762307))

(declare-fun m!762309 () Bool)

(assert (=> b!820305 m!762309))

(declare-fun m!762311 () Bool)

(assert (=> b!820305 m!762311))

(assert (=> b!820305 m!762293))

(declare-fun m!762313 () Bool)

(assert (=> b!820305 m!762313))

(declare-fun m!762315 () Bool)

(assert (=> b!820305 m!762315))

(declare-fun m!762317 () Bool)

(assert (=> b!820305 m!762317))

(assert (=> b!820305 m!762303))

(declare-fun m!762319 () Bool)

(assert (=> b!820305 m!762319))

(assert (=> b!820305 m!762315))

(declare-fun m!762321 () Bool)

(assert (=> b!820305 m!762321))

(declare-fun m!762323 () Bool)

(assert (=> b!820293 m!762323))

(declare-fun m!762325 () Bool)

(assert (=> bm!35698 m!762325))

(declare-fun m!762327 () Bool)

(assert (=> bm!35695 m!762327))

(declare-fun m!762329 () Bool)

(assert (=> bm!35697 m!762329))

(assert (=> b!820299 m!762285))

(assert (=> b!820299 m!762285))

(assert (=> b!820299 m!762287))

(assert (=> b!820301 m!762285))

(assert (=> b!820301 m!762285))

(declare-fun m!762331 () Bool)

(assert (=> b!820301 m!762331))

(declare-fun m!762333 () Bool)

(assert (=> b!820301 m!762333))

(declare-fun m!762335 () Bool)

(assert (=> b!820301 m!762335))

(assert (=> b!820301 m!762335))

(assert (=> b!820301 m!762333))

(declare-fun m!762337 () Bool)

(assert (=> b!820301 m!762337))

(assert (=> b!820171 d!104979))

(declare-fun d!104981 () Bool)

(declare-fun e!455637 () Bool)

(assert (=> d!104981 e!455637))

(declare-fun res!559513 () Bool)

(assert (=> d!104981 (=> (not res!559513) (not e!455637))))

(assert (=> d!104981 (= res!559513 (or (bvsge #b00000000000000000000000000000000 (size!22132 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))))

(declare-fun lt!368083 () ListLongMap!8381)

(declare-fun lt!368088 () ListLongMap!8381)

(assert (=> d!104981 (= lt!368083 lt!368088)))

(declare-fun lt!368084 () Unit!27960)

(declare-fun e!455638 () Unit!27960)

(assert (=> d!104981 (= lt!368084 e!455638)))

(declare-fun c!89419 () Bool)

(declare-fun e!455628 () Bool)

(assert (=> d!104981 (= c!89419 e!455628)))

(declare-fun res!559519 () Bool)

(assert (=> d!104981 (=> (not res!559519) (not e!455628))))

(assert (=> d!104981 (= res!559519 (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(declare-fun e!455640 () ListLongMap!8381)

(assert (=> d!104981 (= lt!368088 e!455640)))

(declare-fun c!89423 () Bool)

(assert (=> d!104981 (= c!89423 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104981 (validMask!0 mask!1312)))

(assert (=> d!104981 (= (getCurrentListMap!2394 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368083)))

(declare-fun b!820312 () Bool)

(declare-fun e!455633 () Bool)

(declare-fun call!35704 () Bool)

(assert (=> b!820312 (= e!455633 (not call!35704))))

(declare-fun b!820313 () Bool)

(declare-fun e!455630 () Bool)

(assert (=> b!820313 (= e!455630 (= (apply!354 lt!368083 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!820314 () Bool)

(declare-fun e!455636 () Bool)

(assert (=> b!820314 (= e!455633 e!455636)))

(declare-fun res!559515 () Bool)

(assert (=> b!820314 (= res!559515 call!35704)))

(assert (=> b!820314 (=> (not res!559515) (not e!455636))))

(declare-fun bm!35700 () Bool)

(declare-fun call!35705 () ListLongMap!8381)

(declare-fun call!35707 () ListLongMap!8381)

(assert (=> bm!35700 (= call!35705 call!35707)))

(declare-fun b!820315 () Bool)

(declare-fun e!455632 () ListLongMap!8381)

(assert (=> b!820315 (= e!455632 call!35705)))

(declare-fun b!820316 () Bool)

(assert (=> b!820316 (= e!455640 (+!1843 call!35707 (tuple2!9557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!820317 () Bool)

(declare-fun Unit!27965 () Unit!27960)

(assert (=> b!820317 (= e!455638 Unit!27965)))

(declare-fun b!820318 () Bool)

(declare-fun e!455629 () ListLongMap!8381)

(assert (=> b!820318 (= e!455640 e!455629)))

(declare-fun c!89420 () Bool)

(assert (=> b!820318 (= c!89420 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35701 () Bool)

(declare-fun call!35708 () ListLongMap!8381)

(declare-fun call!35703 () ListLongMap!8381)

(assert (=> bm!35701 (= call!35708 call!35703)))

(declare-fun b!820319 () Bool)

(declare-fun e!455639 () Bool)

(assert (=> b!820319 (= e!455639 e!455630)))

(declare-fun res!559520 () Bool)

(declare-fun call!35709 () Bool)

(assert (=> b!820319 (= res!559520 call!35709)))

(assert (=> b!820319 (=> (not res!559520) (not e!455630))))

(declare-fun b!820320 () Bool)

(assert (=> b!820320 (= e!455629 call!35705)))

(declare-fun b!820321 () Bool)

(assert (=> b!820321 (= e!455637 e!455633)))

(declare-fun c!89418 () Bool)

(assert (=> b!820321 (= c!89418 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!35706 () ListLongMap!8381)

(declare-fun bm!35702 () Bool)

(assert (=> bm!35702 (= call!35707 (+!1843 (ite c!89423 call!35706 (ite c!89420 call!35703 call!35708)) (ite (or c!89423 c!89420) (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!820322 () Bool)

(declare-fun e!455631 () Bool)

(assert (=> b!820322 (= e!455631 (validKeyInArray!0 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820323 () Bool)

(declare-fun e!455635 () Bool)

(declare-fun e!455634 () Bool)

(assert (=> b!820323 (= e!455635 e!455634)))

(declare-fun res!559518 () Bool)

(assert (=> b!820323 (=> (not res!559518) (not e!455634))))

(assert (=> b!820323 (= res!559518 (contains!4137 lt!368083 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820323 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(declare-fun b!820324 () Bool)

(assert (=> b!820324 (= e!455634 (= (apply!354 lt!368083 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)) (get!11588 (select (arr!21713 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!820324 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22133 _values!788)))))

(assert (=> b!820324 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(declare-fun b!820325 () Bool)

(declare-fun res!559517 () Bool)

(assert (=> b!820325 (=> (not res!559517) (not e!455637))))

(assert (=> b!820325 (= res!559517 e!455639)))

(declare-fun c!89421 () Bool)

(assert (=> b!820325 (= c!89421 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!820326 () Bool)

(assert (=> b!820326 (= e!455636 (= (apply!354 lt!368083 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!820327 () Bool)

(declare-fun c!89422 () Bool)

(assert (=> b!820327 (= c!89422 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!820327 (= e!455629 e!455632)))

(declare-fun b!820328 () Bool)

(declare-fun lt!368103 () Unit!27960)

(assert (=> b!820328 (= e!455638 lt!368103)))

(declare-fun lt!368099 () ListLongMap!8381)

(assert (=> b!820328 (= lt!368099 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368085 () (_ BitVec 64))

(assert (=> b!820328 (= lt!368085 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368092 () (_ BitVec 64))

(assert (=> b!820328 (= lt!368092 (select (arr!21712 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368093 () Unit!27960)

(assert (=> b!820328 (= lt!368093 (addStillContains!308 lt!368099 lt!368085 zeroValueAfter!34 lt!368092))))

(assert (=> b!820328 (contains!4137 (+!1843 lt!368099 (tuple2!9557 lt!368085 zeroValueAfter!34)) lt!368092)))

(declare-fun lt!368097 () Unit!27960)

(assert (=> b!820328 (= lt!368097 lt!368093)))

(declare-fun lt!368087 () ListLongMap!8381)

(assert (=> b!820328 (= lt!368087 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368096 () (_ BitVec 64))

(assert (=> b!820328 (= lt!368096 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368086 () (_ BitVec 64))

(assert (=> b!820328 (= lt!368086 (select (arr!21712 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368102 () Unit!27960)

(assert (=> b!820328 (= lt!368102 (addApplyDifferent!308 lt!368087 lt!368096 minValue!754 lt!368086))))

(assert (=> b!820328 (= (apply!354 (+!1843 lt!368087 (tuple2!9557 lt!368096 minValue!754)) lt!368086) (apply!354 lt!368087 lt!368086))))

(declare-fun lt!368094 () Unit!27960)

(assert (=> b!820328 (= lt!368094 lt!368102)))

(declare-fun lt!368098 () ListLongMap!8381)

(assert (=> b!820328 (= lt!368098 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368100 () (_ BitVec 64))

(assert (=> b!820328 (= lt!368100 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368104 () (_ BitVec 64))

(assert (=> b!820328 (= lt!368104 (select (arr!21712 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368095 () Unit!27960)

(assert (=> b!820328 (= lt!368095 (addApplyDifferent!308 lt!368098 lt!368100 zeroValueAfter!34 lt!368104))))

(assert (=> b!820328 (= (apply!354 (+!1843 lt!368098 (tuple2!9557 lt!368100 zeroValueAfter!34)) lt!368104) (apply!354 lt!368098 lt!368104))))

(declare-fun lt!368091 () Unit!27960)

(assert (=> b!820328 (= lt!368091 lt!368095)))

(declare-fun lt!368101 () ListLongMap!8381)

(assert (=> b!820328 (= lt!368101 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368090 () (_ BitVec 64))

(assert (=> b!820328 (= lt!368090 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368089 () (_ BitVec 64))

(assert (=> b!820328 (= lt!368089 (select (arr!21712 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!820328 (= lt!368103 (addApplyDifferent!308 lt!368101 lt!368090 minValue!754 lt!368089))))

(assert (=> b!820328 (= (apply!354 (+!1843 lt!368101 (tuple2!9557 lt!368090 minValue!754)) lt!368089) (apply!354 lt!368101 lt!368089))))

(declare-fun bm!35703 () Bool)

(assert (=> bm!35703 (= call!35706 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820329 () Bool)

(declare-fun res!559521 () Bool)

(assert (=> b!820329 (=> (not res!559521) (not e!455637))))

(assert (=> b!820329 (= res!559521 e!455635)))

(declare-fun res!559516 () Bool)

(assert (=> b!820329 (=> res!559516 e!455635)))

(assert (=> b!820329 (= res!559516 (not e!455631))))

(declare-fun res!559514 () Bool)

(assert (=> b!820329 (=> (not res!559514) (not e!455631))))

(assert (=> b!820329 (= res!559514 (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(declare-fun bm!35704 () Bool)

(assert (=> bm!35704 (= call!35709 (contains!4137 lt!368083 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!820330 () Bool)

(assert (=> b!820330 (= e!455639 (not call!35709))))

(declare-fun b!820331 () Bool)

(assert (=> b!820331 (= e!455628 (validKeyInArray!0 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820332 () Bool)

(assert (=> b!820332 (= e!455632 call!35708)))

(declare-fun bm!35705 () Bool)

(assert (=> bm!35705 (= call!35704 (contains!4137 lt!368083 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35706 () Bool)

(assert (=> bm!35706 (= call!35703 call!35706)))

(assert (= (and d!104981 c!89423) b!820316))

(assert (= (and d!104981 (not c!89423)) b!820318))

(assert (= (and b!820318 c!89420) b!820320))

(assert (= (and b!820318 (not c!89420)) b!820327))

(assert (= (and b!820327 c!89422) b!820315))

(assert (= (and b!820327 (not c!89422)) b!820332))

(assert (= (or b!820315 b!820332) bm!35701))

(assert (= (or b!820320 bm!35701) bm!35706))

(assert (= (or b!820320 b!820315) bm!35700))

(assert (= (or b!820316 bm!35706) bm!35703))

(assert (= (or b!820316 bm!35700) bm!35702))

(assert (= (and d!104981 res!559519) b!820331))

(assert (= (and d!104981 c!89419) b!820328))

(assert (= (and d!104981 (not c!89419)) b!820317))

(assert (= (and d!104981 res!559513) b!820329))

(assert (= (and b!820329 res!559514) b!820322))

(assert (= (and b!820329 (not res!559516)) b!820323))

(assert (= (and b!820323 res!559518) b!820324))

(assert (= (and b!820329 res!559521) b!820325))

(assert (= (and b!820325 c!89421) b!820319))

(assert (= (and b!820325 (not c!89421)) b!820330))

(assert (= (and b!820319 res!559520) b!820313))

(assert (= (or b!820319 b!820330) bm!35704))

(assert (= (and b!820325 res!559517) b!820321))

(assert (= (and b!820321 c!89418) b!820314))

(assert (= (and b!820321 (not c!89418)) b!820312))

(assert (= (and b!820314 res!559515) b!820326))

(assert (= (or b!820314 b!820312) bm!35705))

(declare-fun b_lambda!10963 () Bool)

(assert (=> (not b_lambda!10963) (not b!820324)))

(assert (=> b!820324 t!21686))

(declare-fun b_and!21701 () Bool)

(assert (= b_and!21699 (and (=> t!21686 result!7899) b_and!21701)))

(assert (=> d!104981 m!762151))

(assert (=> bm!35703 m!762145))

(declare-fun m!762339 () Bool)

(assert (=> b!820326 m!762339))

(assert (=> b!820331 m!762285))

(assert (=> b!820331 m!762285))

(assert (=> b!820331 m!762287))

(declare-fun m!762341 () Bool)

(assert (=> b!820313 m!762341))

(assert (=> b!820323 m!762285))

(assert (=> b!820323 m!762285))

(declare-fun m!762343 () Bool)

(assert (=> b!820323 m!762343))

(declare-fun m!762345 () Bool)

(assert (=> b!820328 m!762345))

(assert (=> b!820328 m!762145))

(assert (=> b!820328 m!762285))

(declare-fun m!762347 () Bool)

(assert (=> b!820328 m!762347))

(declare-fun m!762349 () Bool)

(assert (=> b!820328 m!762349))

(declare-fun m!762351 () Bool)

(assert (=> b!820328 m!762351))

(declare-fun m!762353 () Bool)

(assert (=> b!820328 m!762353))

(declare-fun m!762355 () Bool)

(assert (=> b!820328 m!762355))

(declare-fun m!762357 () Bool)

(assert (=> b!820328 m!762357))

(declare-fun m!762359 () Bool)

(assert (=> b!820328 m!762359))

(assert (=> b!820328 m!762359))

(declare-fun m!762361 () Bool)

(assert (=> b!820328 m!762361))

(declare-fun m!762363 () Bool)

(assert (=> b!820328 m!762363))

(assert (=> b!820328 m!762345))

(declare-fun m!762365 () Bool)

(assert (=> b!820328 m!762365))

(declare-fun m!762367 () Bool)

(assert (=> b!820328 m!762367))

(declare-fun m!762369 () Bool)

(assert (=> b!820328 m!762369))

(assert (=> b!820328 m!762355))

(declare-fun m!762371 () Bool)

(assert (=> b!820328 m!762371))

(assert (=> b!820328 m!762367))

(declare-fun m!762373 () Bool)

(assert (=> b!820328 m!762373))

(declare-fun m!762375 () Bool)

(assert (=> b!820316 m!762375))

(declare-fun m!762377 () Bool)

(assert (=> bm!35705 m!762377))

(declare-fun m!762379 () Bool)

(assert (=> bm!35702 m!762379))

(declare-fun m!762381 () Bool)

(assert (=> bm!35704 m!762381))

(assert (=> b!820322 m!762285))

(assert (=> b!820322 m!762285))

(assert (=> b!820322 m!762287))

(assert (=> b!820324 m!762285))

(assert (=> b!820324 m!762285))

(declare-fun m!762383 () Bool)

(assert (=> b!820324 m!762383))

(assert (=> b!820324 m!762333))

(assert (=> b!820324 m!762335))

(assert (=> b!820324 m!762335))

(assert (=> b!820324 m!762333))

(assert (=> b!820324 m!762337))

(assert (=> b!820171 d!104981))

(declare-fun d!104983 () Bool)

(declare-fun e!455641 () Bool)

(assert (=> d!104983 e!455641))

(declare-fun res!559522 () Bool)

(assert (=> d!104983 (=> (not res!559522) (not e!455641))))

(declare-fun lt!368105 () ListLongMap!8381)

(assert (=> d!104983 (= res!559522 (contains!4137 lt!368105 (_1!4789 lt!367936)))))

(declare-fun lt!368106 () List!15360)

(assert (=> d!104983 (= lt!368105 (ListLongMap!8382 lt!368106))))

(declare-fun lt!368108 () Unit!27960)

(declare-fun lt!368107 () Unit!27960)

(assert (=> d!104983 (= lt!368108 lt!368107)))

(assert (=> d!104983 (= (getValueByKey!403 lt!368106 (_1!4789 lt!367936)) (Some!408 (_2!4789 lt!367936)))))

(assert (=> d!104983 (= lt!368107 (lemmaContainsTupThenGetReturnValue!217 lt!368106 (_1!4789 lt!367936) (_2!4789 lt!367936)))))

(assert (=> d!104983 (= lt!368106 (insertStrictlySorted!256 (toList!4206 lt!367938) (_1!4789 lt!367936) (_2!4789 lt!367936)))))

(assert (=> d!104983 (= (+!1843 lt!367938 lt!367936) lt!368105)))

(declare-fun b!820333 () Bool)

(declare-fun res!559523 () Bool)

(assert (=> b!820333 (=> (not res!559523) (not e!455641))))

(assert (=> b!820333 (= res!559523 (= (getValueByKey!403 (toList!4206 lt!368105) (_1!4789 lt!367936)) (Some!408 (_2!4789 lt!367936))))))

(declare-fun b!820334 () Bool)

(assert (=> b!820334 (= e!455641 (contains!4138 (toList!4206 lt!368105) lt!367936))))

(assert (= (and d!104983 res!559522) b!820333))

(assert (= (and b!820333 res!559523) b!820334))

(declare-fun m!762385 () Bool)

(assert (=> d!104983 m!762385))

(declare-fun m!762387 () Bool)

(assert (=> d!104983 m!762387))

(declare-fun m!762389 () Bool)

(assert (=> d!104983 m!762389))

(declare-fun m!762391 () Bool)

(assert (=> d!104983 m!762391))

(declare-fun m!762393 () Bool)

(assert (=> b!820333 m!762393))

(declare-fun m!762395 () Bool)

(assert (=> b!820334 m!762395))

(assert (=> b!820171 d!104983))

(declare-fun d!104985 () Bool)

(declare-fun e!455642 () Bool)

(assert (=> d!104985 e!455642))

(declare-fun res!559524 () Bool)

(assert (=> d!104985 (=> (not res!559524) (not e!455642))))

(declare-fun lt!368109 () ListLongMap!8381)

(assert (=> d!104985 (= res!559524 (contains!4137 lt!368109 (_1!4789 lt!367935)))))

(declare-fun lt!368110 () List!15360)

(assert (=> d!104985 (= lt!368109 (ListLongMap!8382 lt!368110))))

(declare-fun lt!368112 () Unit!27960)

(declare-fun lt!368111 () Unit!27960)

(assert (=> d!104985 (= lt!368112 lt!368111)))

(assert (=> d!104985 (= (getValueByKey!403 lt!368110 (_1!4789 lt!367935)) (Some!408 (_2!4789 lt!367935)))))

(assert (=> d!104985 (= lt!368111 (lemmaContainsTupThenGetReturnValue!217 lt!368110 (_1!4789 lt!367935) (_2!4789 lt!367935)))))

(assert (=> d!104985 (= lt!368110 (insertStrictlySorted!256 (toList!4206 lt!367937) (_1!4789 lt!367935) (_2!4789 lt!367935)))))

(assert (=> d!104985 (= (+!1843 lt!367937 lt!367935) lt!368109)))

(declare-fun b!820335 () Bool)

(declare-fun res!559525 () Bool)

(assert (=> b!820335 (=> (not res!559525) (not e!455642))))

(assert (=> b!820335 (= res!559525 (= (getValueByKey!403 (toList!4206 lt!368109) (_1!4789 lt!367935)) (Some!408 (_2!4789 lt!367935))))))

(declare-fun b!820336 () Bool)

(assert (=> b!820336 (= e!455642 (contains!4138 (toList!4206 lt!368109) lt!367935))))

(assert (= (and d!104985 res!559524) b!820335))

(assert (= (and b!820335 res!559525) b!820336))

(declare-fun m!762397 () Bool)

(assert (=> d!104985 m!762397))

(declare-fun m!762399 () Bool)

(assert (=> d!104985 m!762399))

(declare-fun m!762401 () Bool)

(assert (=> d!104985 m!762401))

(declare-fun m!762403 () Bool)

(assert (=> d!104985 m!762403))

(declare-fun m!762405 () Bool)

(assert (=> b!820335 m!762405))

(declare-fun m!762407 () Bool)

(assert (=> b!820336 m!762407))

(assert (=> b!820171 d!104985))

(declare-fun d!104987 () Bool)

(declare-fun e!455643 () Bool)

(assert (=> d!104987 e!455643))

(declare-fun res!559526 () Bool)

(assert (=> d!104987 (=> (not res!559526) (not e!455643))))

(declare-fun lt!368113 () ListLongMap!8381)

(assert (=> d!104987 (= res!559526 (contains!4137 lt!368113 (_1!4789 lt!367936)))))

(declare-fun lt!368114 () List!15360)

(assert (=> d!104987 (= lt!368113 (ListLongMap!8382 lt!368114))))

(declare-fun lt!368116 () Unit!27960)

(declare-fun lt!368115 () Unit!27960)

(assert (=> d!104987 (= lt!368116 lt!368115)))

(assert (=> d!104987 (= (getValueByKey!403 lt!368114 (_1!4789 lt!367936)) (Some!408 (_2!4789 lt!367936)))))

(assert (=> d!104987 (= lt!368115 (lemmaContainsTupThenGetReturnValue!217 lt!368114 (_1!4789 lt!367936) (_2!4789 lt!367936)))))

(assert (=> d!104987 (= lt!368114 (insertStrictlySorted!256 (toList!4206 (+!1843 lt!367937 lt!367935)) (_1!4789 lt!367936) (_2!4789 lt!367936)))))

(assert (=> d!104987 (= (+!1843 (+!1843 lt!367937 lt!367935) lt!367936) lt!368113)))

(declare-fun b!820337 () Bool)

(declare-fun res!559527 () Bool)

(assert (=> b!820337 (=> (not res!559527) (not e!455643))))

(assert (=> b!820337 (= res!559527 (= (getValueByKey!403 (toList!4206 lt!368113) (_1!4789 lt!367936)) (Some!408 (_2!4789 lt!367936))))))

(declare-fun b!820338 () Bool)

(assert (=> b!820338 (= e!455643 (contains!4138 (toList!4206 lt!368113) lt!367936))))

(assert (= (and d!104987 res!559526) b!820337))

(assert (= (and b!820337 res!559527) b!820338))

(declare-fun m!762409 () Bool)

(assert (=> d!104987 m!762409))

(declare-fun m!762411 () Bool)

(assert (=> d!104987 m!762411))

(declare-fun m!762413 () Bool)

(assert (=> d!104987 m!762413))

(declare-fun m!762415 () Bool)

(assert (=> d!104987 m!762415))

(declare-fun m!762417 () Bool)

(assert (=> b!820337 m!762417))

(declare-fun m!762419 () Bool)

(assert (=> b!820338 m!762419))

(assert (=> b!820171 d!104987))

(declare-fun d!104989 () Bool)

(assert (=> d!104989 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70692 d!104989))

(declare-fun d!104991 () Bool)

(assert (=> d!104991 (= (array_inv!17385 _keys!976) (bvsge (size!22132 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70692 d!104991))

(declare-fun d!104993 () Bool)

(assert (=> d!104993 (= (array_inv!17386 _values!788) (bvsge (size!22133 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70692 d!104993))

(declare-fun b!820349 () Bool)

(declare-fun e!455652 () Bool)

(declare-fun call!35712 () Bool)

(assert (=> b!820349 (= e!455652 call!35712)))

(declare-fun b!820350 () Bool)

(declare-fun e!455654 () Bool)

(declare-fun e!455653 () Bool)

(assert (=> b!820350 (= e!455654 e!455653)))

(declare-fun res!559536 () Bool)

(assert (=> b!820350 (=> (not res!559536) (not e!455653))))

(declare-fun e!455655 () Bool)

(assert (=> b!820350 (= res!559536 (not e!455655))))

(declare-fun res!559535 () Bool)

(assert (=> b!820350 (=> (not res!559535) (not e!455655))))

(assert (=> b!820350 (= res!559535 (validKeyInArray!0 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35709 () Bool)

(declare-fun c!89426 () Bool)

(assert (=> bm!35709 (= call!35712 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89426 (Cons!15357 (select (arr!21712 _keys!976) #b00000000000000000000000000000000) Nil!15358) Nil!15358)))))

(declare-fun b!820351 () Bool)

(assert (=> b!820351 (= e!455653 e!455652)))

(assert (=> b!820351 (= c!89426 (validKeyInArray!0 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104995 () Bool)

(declare-fun res!559534 () Bool)

(assert (=> d!104995 (=> res!559534 e!455654)))

(assert (=> d!104995 (= res!559534 (bvsge #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(assert (=> d!104995 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15358) e!455654)))

(declare-fun b!820352 () Bool)

(assert (=> b!820352 (= e!455652 call!35712)))

(declare-fun b!820353 () Bool)

(declare-fun contains!4139 (List!15361 (_ BitVec 64)) Bool)

(assert (=> b!820353 (= e!455655 (contains!4139 Nil!15358 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104995 (not res!559534)) b!820350))

(assert (= (and b!820350 res!559535) b!820353))

(assert (= (and b!820350 res!559536) b!820351))

(assert (= (and b!820351 c!89426) b!820349))

(assert (= (and b!820351 (not c!89426)) b!820352))

(assert (= (or b!820349 b!820352) bm!35709))

(assert (=> b!820350 m!762285))

(assert (=> b!820350 m!762285))

(assert (=> b!820350 m!762287))

(assert (=> bm!35709 m!762285))

(declare-fun m!762421 () Bool)

(assert (=> bm!35709 m!762421))

(assert (=> b!820351 m!762285))

(assert (=> b!820351 m!762285))

(assert (=> b!820351 m!762287))

(assert (=> b!820353 m!762285))

(assert (=> b!820353 m!762285))

(declare-fun m!762423 () Bool)

(assert (=> b!820353 m!762423))

(assert (=> b!820176 d!104995))

(declare-fun d!104997 () Bool)

(declare-fun e!455656 () Bool)

(assert (=> d!104997 e!455656))

(declare-fun res!559537 () Bool)

(assert (=> d!104997 (=> (not res!559537) (not e!455656))))

(declare-fun lt!368117 () ListLongMap!8381)

(assert (=> d!104997 (= res!559537 (contains!4137 lt!368117 (_1!4789 (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!368118 () List!15360)

(assert (=> d!104997 (= lt!368117 (ListLongMap!8382 lt!368118))))

(declare-fun lt!368120 () Unit!27960)

(declare-fun lt!368119 () Unit!27960)

(assert (=> d!104997 (= lt!368120 lt!368119)))

(assert (=> d!104997 (= (getValueByKey!403 lt!368118 (_1!4789 (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!408 (_2!4789 (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104997 (= lt!368119 (lemmaContainsTupThenGetReturnValue!217 lt!368118 (_1!4789 (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4789 (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104997 (= lt!368118 (insertStrictlySorted!256 (toList!4206 lt!367937) (_1!4789 (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4789 (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104997 (= (+!1843 lt!367937 (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!368117)))

(declare-fun b!820354 () Bool)

(declare-fun res!559538 () Bool)

(assert (=> b!820354 (=> (not res!559538) (not e!455656))))

(assert (=> b!820354 (= res!559538 (= (getValueByKey!403 (toList!4206 lt!368117) (_1!4789 (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!408 (_2!4789 (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!820355 () Bool)

(assert (=> b!820355 (= e!455656 (contains!4138 (toList!4206 lt!368117) (tuple2!9557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!104997 res!559537) b!820354))

(assert (= (and b!820354 res!559538) b!820355))

(declare-fun m!762425 () Bool)

(assert (=> d!104997 m!762425))

(declare-fun m!762427 () Bool)

(assert (=> d!104997 m!762427))

(declare-fun m!762429 () Bool)

(assert (=> d!104997 m!762429))

(declare-fun m!762431 () Bool)

(assert (=> d!104997 m!762431))

(declare-fun m!762433 () Bool)

(assert (=> b!820354 m!762433))

(declare-fun m!762435 () Bool)

(assert (=> b!820355 m!762435))

(assert (=> b!820174 d!104997))

(declare-fun d!104999 () Bool)

(assert (=> d!104999 (= (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368123 () Unit!27960)

(declare-fun choose!1400 (array!45325 array!45327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24419 V!24419 V!24419 V!24419 (_ BitVec 32) Int) Unit!27960)

(assert (=> d!104999 (= lt!368123 (choose!1400 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104999 (validMask!0 mask!1312)))

(assert (=> d!104999 (= (lemmaNoChangeToArrayThenSameMapNoExtras!389 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368123)))

(declare-fun bs!22855 () Bool)

(assert (= bs!22855 d!104999))

(assert (=> bs!22855 m!762147))

(assert (=> bs!22855 m!762145))

(declare-fun m!762437 () Bool)

(assert (=> bs!22855 m!762437))

(assert (=> bs!22855 m!762151))

(assert (=> b!820169 d!104999))

(declare-fun b!820380 () Bool)

(declare-fun lt!368140 () Unit!27960)

(declare-fun lt!368138 () Unit!27960)

(assert (=> b!820380 (= lt!368140 lt!368138)))

(declare-fun lt!368141 () V!24419)

(declare-fun lt!368143 () (_ BitVec 64))

(declare-fun lt!368144 () (_ BitVec 64))

(declare-fun lt!368142 () ListLongMap!8381)

(assert (=> b!820380 (not (contains!4137 (+!1843 lt!368142 (tuple2!9557 lt!368143 lt!368141)) lt!368144))))

(declare-fun addStillNotContains!181 (ListLongMap!8381 (_ BitVec 64) V!24419 (_ BitVec 64)) Unit!27960)

(assert (=> b!820380 (= lt!368138 (addStillNotContains!181 lt!368142 lt!368143 lt!368141 lt!368144))))

(assert (=> b!820380 (= lt!368144 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!820380 (= lt!368141 (get!11588 (select (arr!21713 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!820380 (= lt!368143 (select (arr!21712 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35715 () ListLongMap!8381)

(assert (=> b!820380 (= lt!368142 call!35715)))

(declare-fun e!455672 () ListLongMap!8381)

(assert (=> b!820380 (= e!455672 (+!1843 call!35715 (tuple2!9557 (select (arr!21712 _keys!976) #b00000000000000000000000000000000) (get!11588 (select (arr!21713 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!105001 () Bool)

(declare-fun e!455677 () Bool)

(assert (=> d!105001 e!455677))

(declare-fun res!559547 () Bool)

(assert (=> d!105001 (=> (not res!559547) (not e!455677))))

(declare-fun lt!368139 () ListLongMap!8381)

(assert (=> d!105001 (= res!559547 (not (contains!4137 lt!368139 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!455675 () ListLongMap!8381)

(assert (=> d!105001 (= lt!368139 e!455675)))

(declare-fun c!89436 () Bool)

(assert (=> d!105001 (= c!89436 (bvsge #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(assert (=> d!105001 (validMask!0 mask!1312)))

(assert (=> d!105001 (= (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368139)))

(declare-fun bm!35712 () Bool)

(assert (=> bm!35712 (= call!35715 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!820381 () Bool)

(assert (=> b!820381 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(assert (=> b!820381 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22133 _values!788)))))

(declare-fun e!455673 () Bool)

(assert (=> b!820381 (= e!455673 (= (apply!354 lt!368139 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)) (get!11588 (select (arr!21713 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!820382 () Bool)

(declare-fun e!455671 () Bool)

(assert (=> b!820382 (= e!455671 e!455673)))

(assert (=> b!820382 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(declare-fun res!559550 () Bool)

(assert (=> b!820382 (= res!559550 (contains!4137 lt!368139 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820382 (=> (not res!559550) (not e!455673))))

(declare-fun b!820383 () Bool)

(declare-fun e!455674 () Bool)

(assert (=> b!820383 (= e!455671 e!455674)))

(declare-fun c!89437 () Bool)

(assert (=> b!820383 (= c!89437 (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(declare-fun b!820384 () Bool)

(declare-fun e!455676 () Bool)

(assert (=> b!820384 (= e!455676 (validKeyInArray!0 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820384 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!820385 () Bool)

(assert (=> b!820385 (= e!455672 call!35715)))

(declare-fun b!820386 () Bool)

(declare-fun res!559549 () Bool)

(assert (=> b!820386 (=> (not res!559549) (not e!455677))))

(assert (=> b!820386 (= res!559549 (not (contains!4137 lt!368139 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!820387 () Bool)

(assert (=> b!820387 (= e!455675 e!455672)))

(declare-fun c!89435 () Bool)

(assert (=> b!820387 (= c!89435 (validKeyInArray!0 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820388 () Bool)

(assert (=> b!820388 (= e!455675 (ListLongMap!8382 Nil!15357))))

(declare-fun b!820389 () Bool)

(declare-fun isEmpty!642 (ListLongMap!8381) Bool)

(assert (=> b!820389 (= e!455674 (isEmpty!642 lt!368139))))

(declare-fun b!820390 () Bool)

(assert (=> b!820390 (= e!455674 (= lt!368139 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!820391 () Bool)

(assert (=> b!820391 (= e!455677 e!455671)))

(declare-fun c!89438 () Bool)

(assert (=> b!820391 (= c!89438 e!455676)))

(declare-fun res!559548 () Bool)

(assert (=> b!820391 (=> (not res!559548) (not e!455676))))

(assert (=> b!820391 (= res!559548 (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(assert (= (and d!105001 c!89436) b!820388))

(assert (= (and d!105001 (not c!89436)) b!820387))

(assert (= (and b!820387 c!89435) b!820380))

(assert (= (and b!820387 (not c!89435)) b!820385))

(assert (= (or b!820380 b!820385) bm!35712))

(assert (= (and d!105001 res!559547) b!820386))

(assert (= (and b!820386 res!559549) b!820391))

(assert (= (and b!820391 res!559548) b!820384))

(assert (= (and b!820391 c!89438) b!820382))

(assert (= (and b!820391 (not c!89438)) b!820383))

(assert (= (and b!820382 res!559550) b!820381))

(assert (= (and b!820383 c!89437) b!820390))

(assert (= (and b!820383 (not c!89437)) b!820389))

(declare-fun b_lambda!10965 () Bool)

(assert (=> (not b_lambda!10965) (not b!820380)))

(assert (=> b!820380 t!21686))

(declare-fun b_and!21703 () Bool)

(assert (= b_and!21701 (and (=> t!21686 result!7899) b_and!21703)))

(declare-fun b_lambda!10967 () Bool)

(assert (=> (not b_lambda!10967) (not b!820381)))

(assert (=> b!820381 t!21686))

(declare-fun b_and!21705 () Bool)

(assert (= b_and!21703 (and (=> t!21686 result!7899) b_and!21705)))

(assert (=> b!820382 m!762285))

(assert (=> b!820382 m!762285))

(declare-fun m!762439 () Bool)

(assert (=> b!820382 m!762439))

(declare-fun m!762441 () Bool)

(assert (=> b!820386 m!762441))

(assert (=> b!820387 m!762285))

(assert (=> b!820387 m!762285))

(assert (=> b!820387 m!762287))

(declare-fun m!762443 () Bool)

(assert (=> b!820390 m!762443))

(assert (=> b!820381 m!762285))

(declare-fun m!762445 () Bool)

(assert (=> b!820381 m!762445))

(assert (=> b!820381 m!762335))

(assert (=> b!820381 m!762333))

(assert (=> b!820381 m!762337))

(assert (=> b!820381 m!762335))

(assert (=> b!820381 m!762333))

(assert (=> b!820381 m!762285))

(assert (=> bm!35712 m!762443))

(declare-fun m!762447 () Bool)

(assert (=> d!105001 m!762447))

(assert (=> d!105001 m!762151))

(assert (=> b!820384 m!762285))

(assert (=> b!820384 m!762285))

(assert (=> b!820384 m!762287))

(declare-fun m!762449 () Bool)

(assert (=> b!820389 m!762449))

(assert (=> b!820380 m!762335))

(assert (=> b!820380 m!762333))

(assert (=> b!820380 m!762337))

(assert (=> b!820380 m!762335))

(declare-fun m!762451 () Bool)

(assert (=> b!820380 m!762451))

(declare-fun m!762453 () Bool)

(assert (=> b!820380 m!762453))

(declare-fun m!762455 () Bool)

(assert (=> b!820380 m!762455))

(assert (=> b!820380 m!762333))

(assert (=> b!820380 m!762285))

(assert (=> b!820380 m!762451))

(declare-fun m!762457 () Bool)

(assert (=> b!820380 m!762457))

(assert (=> b!820169 d!105001))

(declare-fun b!820392 () Bool)

(declare-fun lt!368147 () Unit!27960)

(declare-fun lt!368145 () Unit!27960)

(assert (=> b!820392 (= lt!368147 lt!368145)))

(declare-fun lt!368151 () (_ BitVec 64))

(declare-fun lt!368150 () (_ BitVec 64))

(declare-fun lt!368148 () V!24419)

(declare-fun lt!368149 () ListLongMap!8381)

(assert (=> b!820392 (not (contains!4137 (+!1843 lt!368149 (tuple2!9557 lt!368150 lt!368148)) lt!368151))))

(assert (=> b!820392 (= lt!368145 (addStillNotContains!181 lt!368149 lt!368150 lt!368148 lt!368151))))

(assert (=> b!820392 (= lt!368151 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!820392 (= lt!368148 (get!11588 (select (arr!21713 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!820392 (= lt!368150 (select (arr!21712 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35716 () ListLongMap!8381)

(assert (=> b!820392 (= lt!368149 call!35716)))

(declare-fun e!455679 () ListLongMap!8381)

(assert (=> b!820392 (= e!455679 (+!1843 call!35716 (tuple2!9557 (select (arr!21712 _keys!976) #b00000000000000000000000000000000) (get!11588 (select (arr!21713 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!105003 () Bool)

(declare-fun e!455684 () Bool)

(assert (=> d!105003 e!455684))

(declare-fun res!559551 () Bool)

(assert (=> d!105003 (=> (not res!559551) (not e!455684))))

(declare-fun lt!368146 () ListLongMap!8381)

(assert (=> d!105003 (= res!559551 (not (contains!4137 lt!368146 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!455682 () ListLongMap!8381)

(assert (=> d!105003 (= lt!368146 e!455682)))

(declare-fun c!89440 () Bool)

(assert (=> d!105003 (= c!89440 (bvsge #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(assert (=> d!105003 (validMask!0 mask!1312)))

(assert (=> d!105003 (= (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368146)))

(declare-fun bm!35713 () Bool)

(assert (=> bm!35713 (= call!35716 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!820393 () Bool)

(assert (=> b!820393 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(assert (=> b!820393 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22133 _values!788)))))

(declare-fun e!455680 () Bool)

(assert (=> b!820393 (= e!455680 (= (apply!354 lt!368146 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)) (get!11588 (select (arr!21713 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!820394 () Bool)

(declare-fun e!455678 () Bool)

(assert (=> b!820394 (= e!455678 e!455680)))

(assert (=> b!820394 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(declare-fun res!559554 () Bool)

(assert (=> b!820394 (= res!559554 (contains!4137 lt!368146 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820394 (=> (not res!559554) (not e!455680))))

(declare-fun b!820395 () Bool)

(declare-fun e!455681 () Bool)

(assert (=> b!820395 (= e!455678 e!455681)))

(declare-fun c!89441 () Bool)

(assert (=> b!820395 (= c!89441 (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(declare-fun b!820396 () Bool)

(declare-fun e!455683 () Bool)

(assert (=> b!820396 (= e!455683 (validKeyInArray!0 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820396 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!820397 () Bool)

(assert (=> b!820397 (= e!455679 call!35716)))

(declare-fun b!820398 () Bool)

(declare-fun res!559553 () Bool)

(assert (=> b!820398 (=> (not res!559553) (not e!455684))))

(assert (=> b!820398 (= res!559553 (not (contains!4137 lt!368146 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!820399 () Bool)

(assert (=> b!820399 (= e!455682 e!455679)))

(declare-fun c!89439 () Bool)

(assert (=> b!820399 (= c!89439 (validKeyInArray!0 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820400 () Bool)

(assert (=> b!820400 (= e!455682 (ListLongMap!8382 Nil!15357))))

(declare-fun b!820401 () Bool)

(assert (=> b!820401 (= e!455681 (isEmpty!642 lt!368146))))

(declare-fun b!820402 () Bool)

(assert (=> b!820402 (= e!455681 (= lt!368146 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!820403 () Bool)

(assert (=> b!820403 (= e!455684 e!455678)))

(declare-fun c!89442 () Bool)

(assert (=> b!820403 (= c!89442 e!455683)))

(declare-fun res!559552 () Bool)

(assert (=> b!820403 (=> (not res!559552) (not e!455683))))

(assert (=> b!820403 (= res!559552 (bvslt #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(assert (= (and d!105003 c!89440) b!820400))

(assert (= (and d!105003 (not c!89440)) b!820399))

(assert (= (and b!820399 c!89439) b!820392))

(assert (= (and b!820399 (not c!89439)) b!820397))

(assert (= (or b!820392 b!820397) bm!35713))

(assert (= (and d!105003 res!559551) b!820398))

(assert (= (and b!820398 res!559553) b!820403))

(assert (= (and b!820403 res!559552) b!820396))

(assert (= (and b!820403 c!89442) b!820394))

(assert (= (and b!820403 (not c!89442)) b!820395))

(assert (= (and b!820394 res!559554) b!820393))

(assert (= (and b!820395 c!89441) b!820402))

(assert (= (and b!820395 (not c!89441)) b!820401))

(declare-fun b_lambda!10969 () Bool)

(assert (=> (not b_lambda!10969) (not b!820392)))

(assert (=> b!820392 t!21686))

(declare-fun b_and!21707 () Bool)

(assert (= b_and!21705 (and (=> t!21686 result!7899) b_and!21707)))

(declare-fun b_lambda!10971 () Bool)

(assert (=> (not b_lambda!10971) (not b!820393)))

(assert (=> b!820393 t!21686))

(declare-fun b_and!21709 () Bool)

(assert (= b_and!21707 (and (=> t!21686 result!7899) b_and!21709)))

(assert (=> b!820394 m!762285))

(assert (=> b!820394 m!762285))

(declare-fun m!762459 () Bool)

(assert (=> b!820394 m!762459))

(declare-fun m!762461 () Bool)

(assert (=> b!820398 m!762461))

(assert (=> b!820399 m!762285))

(assert (=> b!820399 m!762285))

(assert (=> b!820399 m!762287))

(declare-fun m!762463 () Bool)

(assert (=> b!820402 m!762463))

(assert (=> b!820393 m!762285))

(declare-fun m!762465 () Bool)

(assert (=> b!820393 m!762465))

(assert (=> b!820393 m!762335))

(assert (=> b!820393 m!762333))

(assert (=> b!820393 m!762337))

(assert (=> b!820393 m!762335))

(assert (=> b!820393 m!762333))

(assert (=> b!820393 m!762285))

(assert (=> bm!35713 m!762463))

(declare-fun m!762467 () Bool)

(assert (=> d!105003 m!762467))

(assert (=> d!105003 m!762151))

(assert (=> b!820396 m!762285))

(assert (=> b!820396 m!762285))

(assert (=> b!820396 m!762287))

(declare-fun m!762469 () Bool)

(assert (=> b!820401 m!762469))

(assert (=> b!820392 m!762335))

(assert (=> b!820392 m!762333))

(assert (=> b!820392 m!762337))

(assert (=> b!820392 m!762335))

(declare-fun m!762471 () Bool)

(assert (=> b!820392 m!762471))

(declare-fun m!762473 () Bool)

(assert (=> b!820392 m!762473))

(declare-fun m!762475 () Bool)

(assert (=> b!820392 m!762475))

(assert (=> b!820392 m!762333))

(assert (=> b!820392 m!762285))

(assert (=> b!820392 m!762471))

(declare-fun m!762477 () Bool)

(assert (=> b!820392 m!762477))

(assert (=> b!820169 d!105003))

(declare-fun d!105005 () Bool)

(declare-fun res!559559 () Bool)

(declare-fun e!455691 () Bool)

(assert (=> d!105005 (=> res!559559 e!455691)))

(assert (=> d!105005 (= res!559559 (bvsge #b00000000000000000000000000000000 (size!22132 _keys!976)))))

(assert (=> d!105005 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!455691)))

(declare-fun b!820412 () Bool)

(declare-fun e!455692 () Bool)

(declare-fun e!455693 () Bool)

(assert (=> b!820412 (= e!455692 e!455693)))

(declare-fun lt!368158 () (_ BitVec 64))

(assert (=> b!820412 (= lt!368158 (select (arr!21712 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368160 () Unit!27960)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45325 (_ BitVec 64) (_ BitVec 32)) Unit!27960)

(assert (=> b!820412 (= lt!368160 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!368158 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!820412 (arrayContainsKey!0 _keys!976 lt!368158 #b00000000000000000000000000000000)))

(declare-fun lt!368159 () Unit!27960)

(assert (=> b!820412 (= lt!368159 lt!368160)))

(declare-fun res!559560 () Bool)

(declare-datatypes ((SeekEntryResult!8677 0))(
  ( (MissingZero!8677 (index!37079 (_ BitVec 32))) (Found!8677 (index!37080 (_ BitVec 32))) (Intermediate!8677 (undefined!9489 Bool) (index!37081 (_ BitVec 32)) (x!69002 (_ BitVec 32))) (Undefined!8677) (MissingVacant!8677 (index!37082 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45325 (_ BitVec 32)) SeekEntryResult!8677)

(assert (=> b!820412 (= res!559560 (= (seekEntryOrOpen!0 (select (arr!21712 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8677 #b00000000000000000000000000000000)))))

(assert (=> b!820412 (=> (not res!559560) (not e!455693))))

(declare-fun b!820413 () Bool)

(declare-fun call!35719 () Bool)

(assert (=> b!820413 (= e!455692 call!35719)))

(declare-fun bm!35716 () Bool)

(assert (=> bm!35716 (= call!35719 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!820414 () Bool)

(assert (=> b!820414 (= e!455693 call!35719)))

(declare-fun b!820415 () Bool)

(assert (=> b!820415 (= e!455691 e!455692)))

(declare-fun c!89445 () Bool)

(assert (=> b!820415 (= c!89445 (validKeyInArray!0 (select (arr!21712 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105005 (not res!559559)) b!820415))

(assert (= (and b!820415 c!89445) b!820412))

(assert (= (and b!820415 (not c!89445)) b!820413))

(assert (= (and b!820412 res!559560) b!820414))

(assert (= (or b!820414 b!820413) bm!35716))

(assert (=> b!820412 m!762285))

(declare-fun m!762479 () Bool)

(assert (=> b!820412 m!762479))

(declare-fun m!762481 () Bool)

(assert (=> b!820412 m!762481))

(assert (=> b!820412 m!762285))

(declare-fun m!762483 () Bool)

(assert (=> b!820412 m!762483))

(declare-fun m!762485 () Bool)

(assert (=> bm!35716 m!762485))

(assert (=> b!820415 m!762285))

(assert (=> b!820415 m!762285))

(assert (=> b!820415 m!762287))

(assert (=> b!820177 d!105005))

(declare-fun b!820423 () Bool)

(declare-fun e!455698 () Bool)

(assert (=> b!820423 (= e!455698 tp_is_empty!14563)))

(declare-fun b!820422 () Bool)

(declare-fun e!455699 () Bool)

(assert (=> b!820422 (= e!455699 tp_is_empty!14563)))

(declare-fun mapNonEmpty!23452 () Bool)

(declare-fun mapRes!23452 () Bool)

(declare-fun tp!45307 () Bool)

(assert (=> mapNonEmpty!23452 (= mapRes!23452 (and tp!45307 e!455699))))

(declare-fun mapRest!23452 () (Array (_ BitVec 32) ValueCell!6866))

(declare-fun mapValue!23452 () ValueCell!6866)

(declare-fun mapKey!23452 () (_ BitVec 32))

(assert (=> mapNonEmpty!23452 (= mapRest!23443 (store mapRest!23452 mapKey!23452 mapValue!23452))))

(declare-fun condMapEmpty!23452 () Bool)

(declare-fun mapDefault!23452 () ValueCell!6866)

(assert (=> mapNonEmpty!23443 (= condMapEmpty!23452 (= mapRest!23443 ((as const (Array (_ BitVec 32) ValueCell!6866)) mapDefault!23452)))))

(assert (=> mapNonEmpty!23443 (= tp!45291 (and e!455698 mapRes!23452))))

(declare-fun mapIsEmpty!23452 () Bool)

(assert (=> mapIsEmpty!23452 mapRes!23452))

(assert (= (and mapNonEmpty!23443 condMapEmpty!23452) mapIsEmpty!23452))

(assert (= (and mapNonEmpty!23443 (not condMapEmpty!23452)) mapNonEmpty!23452))

(assert (= (and mapNonEmpty!23452 ((_ is ValueCellFull!6866) mapValue!23452)) b!820422))

(assert (= (and mapNonEmpty!23443 ((_ is ValueCellFull!6866) mapDefault!23452)) b!820423))

(declare-fun m!762487 () Bool)

(assert (=> mapNonEmpty!23452 m!762487))

(declare-fun b_lambda!10973 () Bool)

(assert (= b_lambda!10967 (or (and start!70692 b_free!12853) b_lambda!10973)))

(declare-fun b_lambda!10975 () Bool)

(assert (= b_lambda!10961 (or (and start!70692 b_free!12853) b_lambda!10975)))

(declare-fun b_lambda!10977 () Bool)

(assert (= b_lambda!10965 (or (and start!70692 b_free!12853) b_lambda!10977)))

(declare-fun b_lambda!10979 () Bool)

(assert (= b_lambda!10963 (or (and start!70692 b_free!12853) b_lambda!10979)))

(declare-fun b_lambda!10981 () Bool)

(assert (= b_lambda!10971 (or (and start!70692 b_free!12853) b_lambda!10981)))

(declare-fun b_lambda!10983 () Bool)

(assert (= b_lambda!10969 (or (and start!70692 b_free!12853) b_lambda!10983)))

(check-sat (not b!820398) (not b!820355) (not b!820353) (not b!820331) (not b!820412) (not d!105003) (not b!820392) (not bm!35705) (not b!820380) (not d!104979) (not bm!35702) b_and!21709 (not d!104981) (not b!820244) (not d!104983) (not b!820290) (not d!104975) (not b!820246) (not d!104987) (not b!820401) (not b!820389) (not b!820299) (not b!820322) (not d!104977) (not d!104973) (not b!820328) (not bm!35709) (not b!820243) (not b!820313) (not b!820333) (not bm!35712) (not b!820336) (not b!820326) (not b!820245) (not b!820308) (not d!104985) (not b!820305) (not b_lambda!10979) (not b!820390) (not bm!35698) (not d!104997) (not b_lambda!10977) tp_is_empty!14563 (not b!820393) (not b!820303) (not b!820335) (not bm!35695) (not b!820334) (not b!820381) (not b!820324) (not bm!35697) (not b!820384) (not b!820300) (not b!820402) (not bm!35713) (not d!104999) (not b!820382) (not b!820351) (not bm!35696) (not mapNonEmpty!23452) (not b!820301) (not b!820350) (not b!820415) (not b!820387) (not b!820293) (not b!820338) (not b!820396) (not b_lambda!10983) (not d!105001) (not b!820354) (not b_lambda!10981) (not b_next!12853) (not bm!35704) (not b!820386) (not b_lambda!10973) (not b!820323) (not b!820337) (not bm!35716) (not bm!35703) (not b_lambda!10975) (not b!820394) (not b!820316) (not b!820399))
(check-sat b_and!21709 (not b_next!12853))
