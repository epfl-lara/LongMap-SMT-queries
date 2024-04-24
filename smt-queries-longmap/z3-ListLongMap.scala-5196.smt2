; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70342 () Bool)

(assert start!70342)

(declare-fun b_free!12583 () Bool)

(declare-fun b_next!12583 () Bool)

(assert (=> start!70342 (= b_free!12583 (not b_next!12583))))

(declare-fun tp!44467 () Bool)

(declare-fun b_and!21373 () Bool)

(assert (=> start!70342 (= tp!44467 b_and!21373)))

(declare-fun b!816255 () Bool)

(declare-fun e!452690 () Bool)

(declare-fun tp_is_empty!14293 () Bool)

(assert (=> b!816255 (= e!452690 tp_is_empty!14293)))

(declare-fun b!816256 () Bool)

(declare-fun e!452688 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((array!44785 0))(
  ( (array!44786 (arr!21447 (Array (_ BitVec 32) (_ BitVec 64))) (size!21867 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44785)

(assert (=> b!816256 (= e!452688 (not (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!21867 _keys!976)))))))

(declare-datatypes ((V!24059 0))(
  ( (V!24060 (val!7194 Int)) )
))
(declare-datatypes ((tuple2!9356 0))(
  ( (tuple2!9357 (_1!4689 (_ BitVec 64)) (_2!4689 V!24059)) )
))
(declare-datatypes ((List!15171 0))(
  ( (Nil!15168) (Cons!15167 (h!16302 tuple2!9356) (t!21482 List!15171)) )
))
(declare-datatypes ((ListLongMap!8181 0))(
  ( (ListLongMap!8182 (toList!4106 List!15171)) )
))
(declare-fun lt!365371 () ListLongMap!8181)

(declare-fun lt!365369 () ListLongMap!8181)

(assert (=> b!816256 (= lt!365371 lt!365369)))

(declare-fun zeroValueBefore!34 () V!24059)

(declare-fun zeroValueAfter!34 () V!24059)

(declare-datatypes ((ValueCell!6731 0))(
  ( (ValueCellFull!6731 (v!9621 V!24059)) (EmptyCell!6731) )
))
(declare-datatypes ((array!44787 0))(
  ( (array!44788 (arr!21448 (Array (_ BitVec 32) ValueCell!6731)) (size!21868 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44787)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!24059)

(declare-datatypes ((Unit!27779 0))(
  ( (Unit!27780) )
))
(declare-fun lt!365370 () Unit!27779)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!301 (array!44785 array!44787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24059 V!24059 V!24059 V!24059 (_ BitVec 32) Int) Unit!27779)

(assert (=> b!816256 (= lt!365370 (lemmaNoChangeToArrayThenSameMapNoExtras!301 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2213 (array!44785 array!44787 (_ BitVec 32) (_ BitVec 32) V!24059 V!24059 (_ BitVec 32) Int) ListLongMap!8181)

(assert (=> b!816256 (= lt!365369 (getCurrentListMapNoExtraKeys!2213 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816256 (= lt!365371 (getCurrentListMapNoExtraKeys!2213 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816257 () Bool)

(declare-fun res!557135 () Bool)

(assert (=> b!816257 (=> (not res!557135) (not e!452688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44785 (_ BitVec 32)) Bool)

(assert (=> b!816257 (= res!557135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816258 () Bool)

(declare-fun res!557134 () Bool)

(assert (=> b!816258 (=> (not res!557134) (not e!452688))))

(assert (=> b!816258 (= res!557134 (and (= (size!21868 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21867 _keys!976) (size!21868 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816259 () Bool)

(declare-fun e!452689 () Bool)

(assert (=> b!816259 (= e!452689 tp_is_empty!14293)))

(declare-fun res!557132 () Bool)

(assert (=> start!70342 (=> (not res!557132) (not e!452688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70342 (= res!557132 (validMask!0 mask!1312))))

(assert (=> start!70342 e!452688))

(assert (=> start!70342 tp_is_empty!14293))

(declare-fun array_inv!17201 (array!44785) Bool)

(assert (=> start!70342 (array_inv!17201 _keys!976)))

(assert (=> start!70342 true))

(declare-fun e!452687 () Bool)

(declare-fun array_inv!17202 (array!44787) Bool)

(assert (=> start!70342 (and (array_inv!17202 _values!788) e!452687)))

(assert (=> start!70342 tp!44467))

(declare-fun b!816260 () Bool)

(declare-fun mapRes!23023 () Bool)

(assert (=> b!816260 (= e!452687 (and e!452690 mapRes!23023))))

(declare-fun condMapEmpty!23023 () Bool)

(declare-fun mapDefault!23023 () ValueCell!6731)

(assert (=> b!816260 (= condMapEmpty!23023 (= (arr!21448 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6731)) mapDefault!23023)))))

(declare-fun b!816261 () Bool)

(declare-fun res!557133 () Bool)

(assert (=> b!816261 (=> (not res!557133) (not e!452688))))

(declare-datatypes ((List!15172 0))(
  ( (Nil!15169) (Cons!15168 (h!16303 (_ BitVec 64)) (t!21483 List!15172)) )
))
(declare-fun arrayNoDuplicates!0 (array!44785 (_ BitVec 32) List!15172) Bool)

(assert (=> b!816261 (= res!557133 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15169))))

(declare-fun mapIsEmpty!23023 () Bool)

(assert (=> mapIsEmpty!23023 mapRes!23023))

(declare-fun mapNonEmpty!23023 () Bool)

(declare-fun tp!44466 () Bool)

(assert (=> mapNonEmpty!23023 (= mapRes!23023 (and tp!44466 e!452689))))

(declare-fun mapRest!23023 () (Array (_ BitVec 32) ValueCell!6731))

(declare-fun mapKey!23023 () (_ BitVec 32))

(declare-fun mapValue!23023 () ValueCell!6731)

(assert (=> mapNonEmpty!23023 (= (arr!21448 _values!788) (store mapRest!23023 mapKey!23023 mapValue!23023))))

(assert (= (and start!70342 res!557132) b!816258))

(assert (= (and b!816258 res!557134) b!816257))

(assert (= (and b!816257 res!557135) b!816261))

(assert (= (and b!816261 res!557133) b!816256))

(assert (= (and b!816260 condMapEmpty!23023) mapIsEmpty!23023))

(assert (= (and b!816260 (not condMapEmpty!23023)) mapNonEmpty!23023))

(get-info :version)

(assert (= (and mapNonEmpty!23023 ((_ is ValueCellFull!6731) mapValue!23023)) b!816259))

(assert (= (and b!816260 ((_ is ValueCellFull!6731) mapDefault!23023)) b!816255))

(assert (= start!70342 b!816260))

(declare-fun m!758319 () Bool)

(assert (=> start!70342 m!758319))

(declare-fun m!758321 () Bool)

(assert (=> start!70342 m!758321))

(declare-fun m!758323 () Bool)

(assert (=> start!70342 m!758323))

(declare-fun m!758325 () Bool)

(assert (=> b!816257 m!758325))

(declare-fun m!758327 () Bool)

(assert (=> b!816256 m!758327))

(declare-fun m!758329 () Bool)

(assert (=> b!816256 m!758329))

(declare-fun m!758331 () Bool)

(assert (=> b!816256 m!758331))

(declare-fun m!758333 () Bool)

(assert (=> b!816261 m!758333))

(declare-fun m!758335 () Bool)

(assert (=> mapNonEmpty!23023 m!758335))

(check-sat (not b!816256) (not b!816261) tp_is_empty!14293 (not mapNonEmpty!23023) (not start!70342) b_and!21373 (not b!816257) (not b_next!12583))
(check-sat b_and!21373 (not b_next!12583))
(get-model)

(declare-fun b!816314 () Bool)

(declare-fun e!452732 () Bool)

(declare-fun e!452733 () Bool)

(assert (=> b!816314 (= e!452732 e!452733)))

(declare-fun c!89226 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!816314 (= c!89226 (validKeyInArray!0 (select (arr!21447 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!816315 () Bool)

(declare-fun call!35557 () Bool)

(assert (=> b!816315 (= e!452733 call!35557)))

(declare-fun d!104789 () Bool)

(declare-fun res!557168 () Bool)

(declare-fun e!452731 () Bool)

(assert (=> d!104789 (=> res!557168 e!452731)))

(assert (=> d!104789 (= res!557168 (bvsge #b00000000000000000000000000000000 (size!21867 _keys!976)))))

(assert (=> d!104789 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15169) e!452731)))

(declare-fun b!816316 () Bool)

(declare-fun e!452730 () Bool)

(declare-fun contains!4125 (List!15172 (_ BitVec 64)) Bool)

(assert (=> b!816316 (= e!452730 (contains!4125 Nil!15169 (select (arr!21447 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!816317 () Bool)

(assert (=> b!816317 (= e!452733 call!35557)))

(declare-fun b!816318 () Bool)

(assert (=> b!816318 (= e!452731 e!452732)))

(declare-fun res!557166 () Bool)

(assert (=> b!816318 (=> (not res!557166) (not e!452732))))

(assert (=> b!816318 (= res!557166 (not e!452730))))

(declare-fun res!557167 () Bool)

(assert (=> b!816318 (=> (not res!557167) (not e!452730))))

(assert (=> b!816318 (= res!557167 (validKeyInArray!0 (select (arr!21447 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35554 () Bool)

(assert (=> bm!35554 (= call!35557 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89226 (Cons!15168 (select (arr!21447 _keys!976) #b00000000000000000000000000000000) Nil!15169) Nil!15169)))))

(assert (= (and d!104789 (not res!557168)) b!816318))

(assert (= (and b!816318 res!557167) b!816316))

(assert (= (and b!816318 res!557166) b!816314))

(assert (= (and b!816314 c!89226) b!816317))

(assert (= (and b!816314 (not c!89226)) b!816315))

(assert (= (or b!816317 b!816315) bm!35554))

(declare-fun m!758373 () Bool)

(assert (=> b!816314 m!758373))

(assert (=> b!816314 m!758373))

(declare-fun m!758375 () Bool)

(assert (=> b!816314 m!758375))

(assert (=> b!816316 m!758373))

(assert (=> b!816316 m!758373))

(declare-fun m!758377 () Bool)

(assert (=> b!816316 m!758377))

(assert (=> b!816318 m!758373))

(assert (=> b!816318 m!758373))

(assert (=> b!816318 m!758375))

(assert (=> bm!35554 m!758373))

(declare-fun m!758379 () Bool)

(assert (=> bm!35554 m!758379))

(assert (=> b!816261 d!104789))

(declare-fun d!104791 () Bool)

(assert (=> d!104791 (= (getCurrentListMapNoExtraKeys!2213 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2213 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365392 () Unit!27779)

(declare-fun choose!1394 (array!44785 array!44787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24059 V!24059 V!24059 V!24059 (_ BitVec 32) Int) Unit!27779)

(assert (=> d!104791 (= lt!365392 (choose!1394 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104791 (validMask!0 mask!1312)))

(assert (=> d!104791 (= (lemmaNoChangeToArrayThenSameMapNoExtras!301 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365392)))

(declare-fun bs!22714 () Bool)

(assert (= bs!22714 d!104791))

(assert (=> bs!22714 m!758331))

(assert (=> bs!22714 m!758329))

(declare-fun m!758381 () Bool)

(assert (=> bs!22714 m!758381))

(assert (=> bs!22714 m!758319))

(assert (=> b!816256 d!104791))

(declare-fun b!816344 () Bool)

(declare-fun e!452753 () Bool)

(assert (=> b!816344 (= e!452753 (validKeyInArray!0 (select (arr!21447 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816344 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!816345 () Bool)

(declare-fun e!452752 () ListLongMap!8181)

(declare-fun e!452748 () ListLongMap!8181)

(assert (=> b!816345 (= e!452752 e!452748)))

(declare-fun c!89238 () Bool)

(assert (=> b!816345 (= c!89238 (validKeyInArray!0 (select (arr!21447 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun call!35560 () ListLongMap!8181)

(declare-fun bm!35557 () Bool)

(assert (=> bm!35557 (= call!35560 (getCurrentListMapNoExtraKeys!2213 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!816346 () Bool)

(declare-fun e!452749 () Bool)

(declare-fun e!452754 () Bool)

(assert (=> b!816346 (= e!452749 e!452754)))

(assert (=> b!816346 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21867 _keys!976)))))

(declare-fun res!557179 () Bool)

(declare-fun lt!365411 () ListLongMap!8181)

(declare-fun contains!4126 (ListLongMap!8181 (_ BitVec 64)) Bool)

(assert (=> b!816346 (= res!557179 (contains!4126 lt!365411 (select (arr!21447 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816346 (=> (not res!557179) (not e!452754))))

(declare-fun b!816347 () Bool)

(declare-fun res!557180 () Bool)

(declare-fun e!452750 () Bool)

(assert (=> b!816347 (=> (not res!557180) (not e!452750))))

(assert (=> b!816347 (= res!557180 (not (contains!4126 lt!365411 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!816348 () Bool)

(assert (=> b!816348 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21867 _keys!976)))))

(assert (=> b!816348 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21868 _values!788)))))

(declare-fun apply!349 (ListLongMap!8181 (_ BitVec 64)) V!24059)

(declare-fun get!11493 (ValueCell!6731 V!24059) V!24059)

(declare-fun dynLambda!957 (Int (_ BitVec 64)) V!24059)

(assert (=> b!816348 (= e!452754 (= (apply!349 lt!365411 (select (arr!21447 _keys!976) #b00000000000000000000000000000000)) (get!11493 (select (arr!21448 _values!788) #b00000000000000000000000000000000) (dynLambda!957 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!816349 () Bool)

(declare-fun e!452751 () Bool)

(assert (=> b!816349 (= e!452749 e!452751)))

(declare-fun c!89237 () Bool)

(assert (=> b!816349 (= c!89237 (bvslt #b00000000000000000000000000000000 (size!21867 _keys!976)))))

(declare-fun b!816350 () Bool)

(assert (=> b!816350 (= e!452750 e!452749)))

(declare-fun c!89235 () Bool)

(assert (=> b!816350 (= c!89235 e!452753)))

(declare-fun res!557177 () Bool)

(assert (=> b!816350 (=> (not res!557177) (not e!452753))))

(assert (=> b!816350 (= res!557177 (bvslt #b00000000000000000000000000000000 (size!21867 _keys!976)))))

(declare-fun b!816351 () Bool)

(assert (=> b!816351 (= e!452748 call!35560)))

(declare-fun b!816352 () Bool)

(declare-fun isEmpty!637 (ListLongMap!8181) Bool)

(assert (=> b!816352 (= e!452751 (isEmpty!637 lt!365411))))

(declare-fun b!816353 () Bool)

(declare-fun lt!365412 () Unit!27779)

(declare-fun lt!365410 () Unit!27779)

(assert (=> b!816353 (= lt!365412 lt!365410)))

(declare-fun lt!365409 () (_ BitVec 64))

(declare-fun lt!365407 () ListLongMap!8181)

(declare-fun lt!365413 () V!24059)

(declare-fun lt!365408 () (_ BitVec 64))

(declare-fun +!1788 (ListLongMap!8181 tuple2!9356) ListLongMap!8181)

(assert (=> b!816353 (not (contains!4126 (+!1788 lt!365407 (tuple2!9357 lt!365408 lt!365413)) lt!365409))))

(declare-fun addStillNotContains!176 (ListLongMap!8181 (_ BitVec 64) V!24059 (_ BitVec 64)) Unit!27779)

(assert (=> b!816353 (= lt!365410 (addStillNotContains!176 lt!365407 lt!365408 lt!365413 lt!365409))))

(assert (=> b!816353 (= lt!365409 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!816353 (= lt!365413 (get!11493 (select (arr!21448 _values!788) #b00000000000000000000000000000000) (dynLambda!957 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!816353 (= lt!365408 (select (arr!21447 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!816353 (= lt!365407 call!35560)))

(assert (=> b!816353 (= e!452748 (+!1788 call!35560 (tuple2!9357 (select (arr!21447 _keys!976) #b00000000000000000000000000000000) (get!11493 (select (arr!21448 _values!788) #b00000000000000000000000000000000) (dynLambda!957 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!816354 () Bool)

(assert (=> b!816354 (= e!452752 (ListLongMap!8182 Nil!15168))))

(declare-fun b!816343 () Bool)

(assert (=> b!816343 (= e!452751 (= lt!365411 (getCurrentListMapNoExtraKeys!2213 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun d!104793 () Bool)

(assert (=> d!104793 e!452750))

(declare-fun res!557178 () Bool)

(assert (=> d!104793 (=> (not res!557178) (not e!452750))))

(assert (=> d!104793 (= res!557178 (not (contains!4126 lt!365411 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104793 (= lt!365411 e!452752)))

(declare-fun c!89236 () Bool)

(assert (=> d!104793 (= c!89236 (bvsge #b00000000000000000000000000000000 (size!21867 _keys!976)))))

(assert (=> d!104793 (validMask!0 mask!1312)))

(assert (=> d!104793 (= (getCurrentListMapNoExtraKeys!2213 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365411)))

(assert (= (and d!104793 c!89236) b!816354))

(assert (= (and d!104793 (not c!89236)) b!816345))

(assert (= (and b!816345 c!89238) b!816353))

(assert (= (and b!816345 (not c!89238)) b!816351))

(assert (= (or b!816353 b!816351) bm!35557))

(assert (= (and d!104793 res!557178) b!816347))

(assert (= (and b!816347 res!557180) b!816350))

(assert (= (and b!816350 res!557177) b!816344))

(assert (= (and b!816350 c!89235) b!816346))

(assert (= (and b!816350 (not c!89235)) b!816349))

(assert (= (and b!816346 res!557179) b!816348))

(assert (= (and b!816349 c!89237) b!816343))

(assert (= (and b!816349 (not c!89237)) b!816352))

(declare-fun b_lambda!10861 () Bool)

(assert (=> (not b_lambda!10861) (not b!816348)))

(declare-fun t!21487 () Bool)

(declare-fun tb!4171 () Bool)

(assert (=> (and start!70342 (= defaultEntry!796 defaultEntry!796) t!21487) tb!4171))

(declare-fun result!7869 () Bool)

(assert (=> tb!4171 (= result!7869 tp_is_empty!14293)))

(assert (=> b!816348 t!21487))

(declare-fun b_and!21379 () Bool)

(assert (= b_and!21373 (and (=> t!21487 result!7869) b_and!21379)))

(declare-fun b_lambda!10863 () Bool)

(assert (=> (not b_lambda!10863) (not b!816353)))

(assert (=> b!816353 t!21487))

(declare-fun b_and!21381 () Bool)

(assert (= b_and!21379 (and (=> t!21487 result!7869) b_and!21381)))

(declare-fun m!758383 () Bool)

(assert (=> b!816347 m!758383))

(assert (=> b!816346 m!758373))

(assert (=> b!816346 m!758373))

(declare-fun m!758385 () Bool)

(assert (=> b!816346 m!758385))

(assert (=> b!816344 m!758373))

(assert (=> b!816344 m!758373))

(assert (=> b!816344 m!758375))

(declare-fun m!758387 () Bool)

(assert (=> bm!35557 m!758387))

(assert (=> b!816345 m!758373))

(assert (=> b!816345 m!758373))

(assert (=> b!816345 m!758375))

(declare-fun m!758389 () Bool)

(assert (=> d!104793 m!758389))

(assert (=> d!104793 m!758319))

(declare-fun m!758391 () Bool)

(assert (=> b!816353 m!758391))

(assert (=> b!816353 m!758373))

(declare-fun m!758393 () Bool)

(assert (=> b!816353 m!758393))

(declare-fun m!758395 () Bool)

(assert (=> b!816353 m!758395))

(declare-fun m!758397 () Bool)

(assert (=> b!816353 m!758397))

(assert (=> b!816353 m!758391))

(declare-fun m!758399 () Bool)

(assert (=> b!816353 m!758399))

(declare-fun m!758401 () Bool)

(assert (=> b!816353 m!758401))

(assert (=> b!816353 m!758393))

(assert (=> b!816353 m!758397))

(declare-fun m!758403 () Bool)

(assert (=> b!816353 m!758403))

(declare-fun m!758405 () Bool)

(assert (=> b!816352 m!758405))

(assert (=> b!816343 m!758387))

(assert (=> b!816348 m!758373))

(declare-fun m!758407 () Bool)

(assert (=> b!816348 m!758407))

(assert (=> b!816348 m!758373))

(assert (=> b!816348 m!758393))

(assert (=> b!816348 m!758397))

(assert (=> b!816348 m!758393))

(assert (=> b!816348 m!758397))

(assert (=> b!816348 m!758403))

(assert (=> b!816256 d!104793))

(declare-fun b!816358 () Bool)

(declare-fun e!452760 () Bool)

(assert (=> b!816358 (= e!452760 (validKeyInArray!0 (select (arr!21447 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816358 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!816359 () Bool)

(declare-fun e!452759 () ListLongMap!8181)

(declare-fun e!452755 () ListLongMap!8181)

(assert (=> b!816359 (= e!452759 e!452755)))

(declare-fun c!89242 () Bool)

(assert (=> b!816359 (= c!89242 (validKeyInArray!0 (select (arr!21447 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun call!35561 () ListLongMap!8181)

(declare-fun bm!35558 () Bool)

(assert (=> bm!35558 (= call!35561 (getCurrentListMapNoExtraKeys!2213 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!816360 () Bool)

(declare-fun e!452756 () Bool)

(declare-fun e!452761 () Bool)

(assert (=> b!816360 (= e!452756 e!452761)))

(assert (=> b!816360 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21867 _keys!976)))))

(declare-fun res!557183 () Bool)

(declare-fun lt!365418 () ListLongMap!8181)

(assert (=> b!816360 (= res!557183 (contains!4126 lt!365418 (select (arr!21447 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!816360 (=> (not res!557183) (not e!452761))))

(declare-fun b!816361 () Bool)

(declare-fun res!557184 () Bool)

(declare-fun e!452757 () Bool)

(assert (=> b!816361 (=> (not res!557184) (not e!452757))))

(assert (=> b!816361 (= res!557184 (not (contains!4126 lt!365418 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!816362 () Bool)

(assert (=> b!816362 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21867 _keys!976)))))

(assert (=> b!816362 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21868 _values!788)))))

(assert (=> b!816362 (= e!452761 (= (apply!349 lt!365418 (select (arr!21447 _keys!976) #b00000000000000000000000000000000)) (get!11493 (select (arr!21448 _values!788) #b00000000000000000000000000000000) (dynLambda!957 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!816363 () Bool)

(declare-fun e!452758 () Bool)

(assert (=> b!816363 (= e!452756 e!452758)))

(declare-fun c!89241 () Bool)

(assert (=> b!816363 (= c!89241 (bvslt #b00000000000000000000000000000000 (size!21867 _keys!976)))))

(declare-fun b!816364 () Bool)

(assert (=> b!816364 (= e!452757 e!452756)))

(declare-fun c!89239 () Bool)

(assert (=> b!816364 (= c!89239 e!452760)))

(declare-fun res!557181 () Bool)

(assert (=> b!816364 (=> (not res!557181) (not e!452760))))

(assert (=> b!816364 (= res!557181 (bvslt #b00000000000000000000000000000000 (size!21867 _keys!976)))))

(declare-fun b!816365 () Bool)

(assert (=> b!816365 (= e!452755 call!35561)))

(declare-fun b!816366 () Bool)

(assert (=> b!816366 (= e!452758 (isEmpty!637 lt!365418))))

(declare-fun b!816367 () Bool)

(declare-fun lt!365419 () Unit!27779)

(declare-fun lt!365417 () Unit!27779)

(assert (=> b!816367 (= lt!365419 lt!365417)))

(declare-fun lt!365414 () ListLongMap!8181)

(declare-fun lt!365415 () (_ BitVec 64))

(declare-fun lt!365416 () (_ BitVec 64))

(declare-fun lt!365420 () V!24059)

(assert (=> b!816367 (not (contains!4126 (+!1788 lt!365414 (tuple2!9357 lt!365415 lt!365420)) lt!365416))))

(assert (=> b!816367 (= lt!365417 (addStillNotContains!176 lt!365414 lt!365415 lt!365420 lt!365416))))

(assert (=> b!816367 (= lt!365416 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!816367 (= lt!365420 (get!11493 (select (arr!21448 _values!788) #b00000000000000000000000000000000) (dynLambda!957 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!816367 (= lt!365415 (select (arr!21447 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!816367 (= lt!365414 call!35561)))

(assert (=> b!816367 (= e!452755 (+!1788 call!35561 (tuple2!9357 (select (arr!21447 _keys!976) #b00000000000000000000000000000000) (get!11493 (select (arr!21448 _values!788) #b00000000000000000000000000000000) (dynLambda!957 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!816368 () Bool)

(assert (=> b!816368 (= e!452759 (ListLongMap!8182 Nil!15168))))

(declare-fun b!816357 () Bool)

(assert (=> b!816357 (= e!452758 (= lt!365418 (getCurrentListMapNoExtraKeys!2213 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun d!104795 () Bool)

(assert (=> d!104795 e!452757))

(declare-fun res!557182 () Bool)

(assert (=> d!104795 (=> (not res!557182) (not e!452757))))

(assert (=> d!104795 (= res!557182 (not (contains!4126 lt!365418 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104795 (= lt!365418 e!452759)))

(declare-fun c!89240 () Bool)

(assert (=> d!104795 (= c!89240 (bvsge #b00000000000000000000000000000000 (size!21867 _keys!976)))))

(assert (=> d!104795 (validMask!0 mask!1312)))

(assert (=> d!104795 (= (getCurrentListMapNoExtraKeys!2213 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!365418)))

(assert (= (and d!104795 c!89240) b!816368))

(assert (= (and d!104795 (not c!89240)) b!816359))

(assert (= (and b!816359 c!89242) b!816367))

(assert (= (and b!816359 (not c!89242)) b!816365))

(assert (= (or b!816367 b!816365) bm!35558))

(assert (= (and d!104795 res!557182) b!816361))

(assert (= (and b!816361 res!557184) b!816364))

(assert (= (and b!816364 res!557181) b!816358))

(assert (= (and b!816364 c!89239) b!816360))

(assert (= (and b!816364 (not c!89239)) b!816363))

(assert (= (and b!816360 res!557183) b!816362))

(assert (= (and b!816363 c!89241) b!816357))

(assert (= (and b!816363 (not c!89241)) b!816366))

(declare-fun b_lambda!10865 () Bool)

(assert (=> (not b_lambda!10865) (not b!816362)))

(assert (=> b!816362 t!21487))

(declare-fun b_and!21383 () Bool)

(assert (= b_and!21381 (and (=> t!21487 result!7869) b_and!21383)))

(declare-fun b_lambda!10867 () Bool)

(assert (=> (not b_lambda!10867) (not b!816367)))

(assert (=> b!816367 t!21487))

(declare-fun b_and!21385 () Bool)

(assert (= b_and!21383 (and (=> t!21487 result!7869) b_and!21385)))

(declare-fun m!758409 () Bool)

(assert (=> b!816361 m!758409))

(assert (=> b!816360 m!758373))

(assert (=> b!816360 m!758373))

(declare-fun m!758411 () Bool)

(assert (=> b!816360 m!758411))

(assert (=> b!816358 m!758373))

(assert (=> b!816358 m!758373))

(assert (=> b!816358 m!758375))

(declare-fun m!758413 () Bool)

(assert (=> bm!35558 m!758413))

(assert (=> b!816359 m!758373))

(assert (=> b!816359 m!758373))

(assert (=> b!816359 m!758375))

(declare-fun m!758415 () Bool)

(assert (=> d!104795 m!758415))

(assert (=> d!104795 m!758319))

(declare-fun m!758417 () Bool)

(assert (=> b!816367 m!758417))

(assert (=> b!816367 m!758373))

(assert (=> b!816367 m!758393))

(declare-fun m!758419 () Bool)

(assert (=> b!816367 m!758419))

(assert (=> b!816367 m!758397))

(assert (=> b!816367 m!758417))

(declare-fun m!758421 () Bool)

(assert (=> b!816367 m!758421))

(declare-fun m!758423 () Bool)

(assert (=> b!816367 m!758423))

(assert (=> b!816367 m!758393))

(assert (=> b!816367 m!758397))

(assert (=> b!816367 m!758403))

(declare-fun m!758425 () Bool)

(assert (=> b!816366 m!758425))

(assert (=> b!816357 m!758413))

(assert (=> b!816362 m!758373))

(declare-fun m!758427 () Bool)

(assert (=> b!816362 m!758427))

(assert (=> b!816362 m!758373))

(assert (=> b!816362 m!758393))

(assert (=> b!816362 m!758397))

(assert (=> b!816362 m!758393))

(assert (=> b!816362 m!758397))

(assert (=> b!816362 m!758403))

(assert (=> b!816256 d!104795))

(declare-fun d!104797 () Bool)

(assert (=> d!104797 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70342 d!104797))

(declare-fun d!104799 () Bool)

(assert (=> d!104799 (= (array_inv!17201 _keys!976) (bvsge (size!21867 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70342 d!104799))

(declare-fun d!104801 () Bool)

(assert (=> d!104801 (= (array_inv!17202 _values!788) (bvsge (size!21868 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70342 d!104801))

(declare-fun b!816377 () Bool)

(declare-fun e!452768 () Bool)

(declare-fun call!35564 () Bool)

(assert (=> b!816377 (= e!452768 call!35564)))

(declare-fun b!816378 () Bool)

(declare-fun e!452770 () Bool)

(assert (=> b!816378 (= e!452770 e!452768)))

(declare-fun lt!365429 () (_ BitVec 64))

(assert (=> b!816378 (= lt!365429 (select (arr!21447 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!365428 () Unit!27779)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44785 (_ BitVec 64) (_ BitVec 32)) Unit!27779)

(assert (=> b!816378 (= lt!365428 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!365429 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!816378 (arrayContainsKey!0 _keys!976 lt!365429 #b00000000000000000000000000000000)))

(declare-fun lt!365427 () Unit!27779)

(assert (=> b!816378 (= lt!365427 lt!365428)))

(declare-fun res!557189 () Bool)

(declare-datatypes ((SeekEntryResult!8672 0))(
  ( (MissingZero!8672 (index!37059 (_ BitVec 32))) (Found!8672 (index!37060 (_ BitVec 32))) (Intermediate!8672 (undefined!9484 Bool) (index!37061 (_ BitVec 32)) (x!68582 (_ BitVec 32))) (Undefined!8672) (MissingVacant!8672 (index!37062 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44785 (_ BitVec 32)) SeekEntryResult!8672)

(assert (=> b!816378 (= res!557189 (= (seekEntryOrOpen!0 (select (arr!21447 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8672 #b00000000000000000000000000000000)))))

(assert (=> b!816378 (=> (not res!557189) (not e!452768))))

(declare-fun b!816379 () Bool)

(declare-fun e!452769 () Bool)

(assert (=> b!816379 (= e!452769 e!452770)))

(declare-fun c!89245 () Bool)

(assert (=> b!816379 (= c!89245 (validKeyInArray!0 (select (arr!21447 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104803 () Bool)

(declare-fun res!557190 () Bool)

(assert (=> d!104803 (=> res!557190 e!452769)))

(assert (=> d!104803 (= res!557190 (bvsge #b00000000000000000000000000000000 (size!21867 _keys!976)))))

(assert (=> d!104803 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!452769)))

(declare-fun bm!35561 () Bool)

(assert (=> bm!35561 (= call!35564 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!816380 () Bool)

(assert (=> b!816380 (= e!452770 call!35564)))

(assert (= (and d!104803 (not res!557190)) b!816379))

(assert (= (and b!816379 c!89245) b!816378))

(assert (= (and b!816379 (not c!89245)) b!816380))

(assert (= (and b!816378 res!557189) b!816377))

(assert (= (or b!816377 b!816380) bm!35561))

(assert (=> b!816378 m!758373))

(declare-fun m!758429 () Bool)

(assert (=> b!816378 m!758429))

(declare-fun m!758431 () Bool)

(assert (=> b!816378 m!758431))

(assert (=> b!816378 m!758373))

(declare-fun m!758433 () Bool)

(assert (=> b!816378 m!758433))

(assert (=> b!816379 m!758373))

(assert (=> b!816379 m!758373))

(assert (=> b!816379 m!758375))

(declare-fun m!758435 () Bool)

(assert (=> bm!35561 m!758435))

(assert (=> b!816257 d!104803))

(declare-fun mapNonEmpty!23032 () Bool)

(declare-fun mapRes!23032 () Bool)

(declare-fun tp!44482 () Bool)

(declare-fun e!452776 () Bool)

(assert (=> mapNonEmpty!23032 (= mapRes!23032 (and tp!44482 e!452776))))

(declare-fun mapValue!23032 () ValueCell!6731)

(declare-fun mapKey!23032 () (_ BitVec 32))

(declare-fun mapRest!23032 () (Array (_ BitVec 32) ValueCell!6731))

(assert (=> mapNonEmpty!23032 (= mapRest!23023 (store mapRest!23032 mapKey!23032 mapValue!23032))))

(declare-fun mapIsEmpty!23032 () Bool)

(assert (=> mapIsEmpty!23032 mapRes!23032))

(declare-fun b!816388 () Bool)

(declare-fun e!452775 () Bool)

(assert (=> b!816388 (= e!452775 tp_is_empty!14293)))

(declare-fun condMapEmpty!23032 () Bool)

(declare-fun mapDefault!23032 () ValueCell!6731)

(assert (=> mapNonEmpty!23023 (= condMapEmpty!23032 (= mapRest!23023 ((as const (Array (_ BitVec 32) ValueCell!6731)) mapDefault!23032)))))

(assert (=> mapNonEmpty!23023 (= tp!44466 (and e!452775 mapRes!23032))))

(declare-fun b!816387 () Bool)

(assert (=> b!816387 (= e!452776 tp_is_empty!14293)))

(assert (= (and mapNonEmpty!23023 condMapEmpty!23032) mapIsEmpty!23032))

(assert (= (and mapNonEmpty!23023 (not condMapEmpty!23032)) mapNonEmpty!23032))

(assert (= (and mapNonEmpty!23032 ((_ is ValueCellFull!6731) mapValue!23032)) b!816387))

(assert (= (and mapNonEmpty!23023 ((_ is ValueCellFull!6731) mapDefault!23032)) b!816388))

(declare-fun m!758437 () Bool)

(assert (=> mapNonEmpty!23032 m!758437))

(declare-fun b_lambda!10869 () Bool)

(assert (= b_lambda!10861 (or (and start!70342 b_free!12583) b_lambda!10869)))

(declare-fun b_lambda!10871 () Bool)

(assert (= b_lambda!10865 (or (and start!70342 b_free!12583) b_lambda!10871)))

(declare-fun b_lambda!10873 () Bool)

(assert (= b_lambda!10867 (or (and start!70342 b_free!12583) b_lambda!10873)))

(declare-fun b_lambda!10875 () Bool)

(assert (= b_lambda!10863 (or (and start!70342 b_free!12583) b_lambda!10875)))

(check-sat (not b!816346) (not b_lambda!10873) b_and!21385 (not d!104793) (not bm!35557) (not b_next!12583) (not b!816343) (not d!104791) (not d!104795) (not b!816316) (not b!816366) (not bm!35554) (not b!816367) (not b!816344) (not b!816347) (not b!816361) (not b!816358) (not b!816362) (not b_lambda!10875) (not b!816348) (not b!816357) tp_is_empty!14293 (not b!816359) (not b!816345) (not mapNonEmpty!23032) (not b!816318) (not b!816378) (not b!816353) (not bm!35561) (not bm!35558) (not b_lambda!10869) (not b_lambda!10871) (not b!816314) (not b!816352) (not b!816379) (not b!816360))
(check-sat b_and!21385 (not b_next!12583))
