; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70436 () Bool)

(assert start!70436)

(declare-fun b_free!12799 () Bool)

(declare-fun b_next!12799 () Bool)

(assert (=> start!70436 (= b_free!12799 (not b_next!12799))))

(declare-fun tp!45126 () Bool)

(declare-fun b_and!21593 () Bool)

(assert (=> start!70436 (= tp!45126 b_and!21593)))

(declare-fun mapIsEmpty!23359 () Bool)

(declare-fun mapRes!23359 () Bool)

(assert (=> mapIsEmpty!23359 mapRes!23359))

(declare-fun res!558441 () Bool)

(declare-fun e!454145 () Bool)

(assert (=> start!70436 (=> (not res!558441) (not e!454145))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70436 (= res!558441 (validMask!0 mask!1312))))

(assert (=> start!70436 e!454145))

(declare-fun tp_is_empty!14509 () Bool)

(assert (=> start!70436 tp_is_empty!14509))

(declare-datatypes ((array!45191 0))(
  ( (array!45192 (arr!21651 (Array (_ BitVec 32) (_ BitVec 64))) (size!22072 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45191)

(declare-fun array_inv!17383 (array!45191) Bool)

(assert (=> start!70436 (array_inv!17383 _keys!976)))

(assert (=> start!70436 true))

(declare-datatypes ((V!24347 0))(
  ( (V!24348 (val!7302 Int)) )
))
(declare-datatypes ((ValueCell!6839 0))(
  ( (ValueCellFull!6839 (v!9725 V!24347)) (EmptyCell!6839) )
))
(declare-datatypes ((array!45193 0))(
  ( (array!45194 (arr!21652 (Array (_ BitVec 32) ValueCell!6839)) (size!22073 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45193)

(declare-fun e!454148 () Bool)

(declare-fun array_inv!17384 (array!45193) Bool)

(assert (=> start!70436 (and (array_inv!17384 _values!788) e!454148)))

(assert (=> start!70436 tp!45126))

(declare-fun b!818157 () Bool)

(declare-fun e!454146 () Bool)

(assert (=> b!818157 (= e!454146 tp_is_empty!14509)))

(declare-fun b!818158 () Bool)

(declare-fun e!454150 () Bool)

(assert (=> b!818158 (= e!454150 tp_is_empty!14509)))

(declare-fun b!818159 () Bool)

(assert (=> b!818159 (= e!454148 (and e!454150 mapRes!23359))))

(declare-fun condMapEmpty!23359 () Bool)

(declare-fun mapDefault!23359 () ValueCell!6839)

(assert (=> b!818159 (= condMapEmpty!23359 (= (arr!21652 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6839)) mapDefault!23359)))))

(declare-fun b!818160 () Bool)

(declare-fun res!558440 () Bool)

(assert (=> b!818160 (=> (not res!558440) (not e!454145))))

(declare-datatypes ((List!15441 0))(
  ( (Nil!15438) (Cons!15437 (h!16566 (_ BitVec 64)) (t!21759 List!15441)) )
))
(declare-fun arrayNoDuplicates!0 (array!45191 (_ BitVec 32) List!15441) Bool)

(assert (=> b!818160 (= res!558440 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15438))))

(declare-fun b!818161 () Bool)

(declare-fun e!454149 () Bool)

(assert (=> b!818161 (= e!454145 (not e!454149))))

(declare-fun res!558442 () Bool)

(assert (=> b!818161 (=> res!558442 e!454149)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818161 (= res!558442 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9618 0))(
  ( (tuple2!9619 (_1!4820 (_ BitVec 64)) (_2!4820 V!24347)) )
))
(declare-datatypes ((List!15442 0))(
  ( (Nil!15439) (Cons!15438 (h!16567 tuple2!9618) (t!21760 List!15442)) )
))
(declare-datatypes ((ListLongMap!8431 0))(
  ( (ListLongMap!8432 (toList!4231 List!15442)) )
))
(declare-fun lt!366468 () ListLongMap!8431)

(declare-fun lt!366469 () ListLongMap!8431)

(assert (=> b!818161 (= lt!366468 lt!366469)))

(declare-fun zeroValueBefore!34 () V!24347)

(declare-fun zeroValueAfter!34 () V!24347)

(declare-fun minValue!754 () V!24347)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27886 0))(
  ( (Unit!27887) )
))
(declare-fun lt!366467 () Unit!27886)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!382 (array!45191 array!45193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24347 V!24347 V!24347 V!24347 (_ BitVec 32) Int) Unit!27886)

(assert (=> b!818161 (= lt!366467 (lemmaNoChangeToArrayThenSameMapNoExtras!382 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2289 (array!45191 array!45193 (_ BitVec 32) (_ BitVec 32) V!24347 V!24347 (_ BitVec 32) Int) ListLongMap!8431)

(assert (=> b!818161 (= lt!366469 (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818161 (= lt!366468 (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818162 () Bool)

(declare-fun res!558438 () Bool)

(assert (=> b!818162 (=> (not res!558438) (not e!454145))))

(assert (=> b!818162 (= res!558438 (and (= (size!22073 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22072 _keys!976) (size!22073 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818163 () Bool)

(assert (=> b!818163 (= e!454149 (bvsle #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(declare-fun lt!366466 () ListLongMap!8431)

(declare-fun getCurrentListMap!2382 (array!45191 array!45193 (_ BitVec 32) (_ BitVec 32) V!24347 V!24347 (_ BitVec 32) Int) ListLongMap!8431)

(assert (=> b!818163 (= lt!366466 (getCurrentListMap!2382 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818164 () Bool)

(declare-fun res!558439 () Bool)

(assert (=> b!818164 (=> (not res!558439) (not e!454145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45191 (_ BitVec 32)) Bool)

(assert (=> b!818164 (= res!558439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23359 () Bool)

(declare-fun tp!45127 () Bool)

(assert (=> mapNonEmpty!23359 (= mapRes!23359 (and tp!45127 e!454146))))

(declare-fun mapRest!23359 () (Array (_ BitVec 32) ValueCell!6839))

(declare-fun mapValue!23359 () ValueCell!6839)

(declare-fun mapKey!23359 () (_ BitVec 32))

(assert (=> mapNonEmpty!23359 (= (arr!21652 _values!788) (store mapRest!23359 mapKey!23359 mapValue!23359))))

(assert (= (and start!70436 res!558441) b!818162))

(assert (= (and b!818162 res!558438) b!818164))

(assert (= (and b!818164 res!558439) b!818160))

(assert (= (and b!818160 res!558440) b!818161))

(assert (= (and b!818161 (not res!558442)) b!818163))

(assert (= (and b!818159 condMapEmpty!23359) mapIsEmpty!23359))

(assert (= (and b!818159 (not condMapEmpty!23359)) mapNonEmpty!23359))

(get-info :version)

(assert (= (and mapNonEmpty!23359 ((_ is ValueCellFull!6839) mapValue!23359)) b!818157))

(assert (= (and b!818159 ((_ is ValueCellFull!6839) mapDefault!23359)) b!818158))

(assert (= start!70436 b!818159))

(declare-fun m!759073 () Bool)

(assert (=> start!70436 m!759073))

(declare-fun m!759075 () Bool)

(assert (=> start!70436 m!759075))

(declare-fun m!759077 () Bool)

(assert (=> start!70436 m!759077))

(declare-fun m!759079 () Bool)

(assert (=> b!818160 m!759079))

(declare-fun m!759081 () Bool)

(assert (=> b!818163 m!759081))

(declare-fun m!759083 () Bool)

(assert (=> b!818164 m!759083))

(declare-fun m!759085 () Bool)

(assert (=> mapNonEmpty!23359 m!759085))

(declare-fun m!759087 () Bool)

(assert (=> b!818161 m!759087))

(declare-fun m!759089 () Bool)

(assert (=> b!818161 m!759089))

(declare-fun m!759091 () Bool)

(assert (=> b!818161 m!759091))

(check-sat (not b!818161) (not b_next!12799) tp_is_empty!14509 (not b!818160) (not b!818163) (not start!70436) b_and!21593 (not mapNonEmpty!23359) (not b!818164))
(check-sat b_and!21593 (not b_next!12799))
(get-model)

(declare-fun b!818223 () Bool)

(declare-fun e!454195 () Bool)

(declare-fun call!35582 () Bool)

(assert (=> b!818223 (= e!454195 call!35582)))

(declare-fun bm!35579 () Bool)

(declare-fun c!89015 () Bool)

(assert (=> bm!35579 (= call!35582 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89015 (Cons!15437 (select (arr!21651 _keys!976) #b00000000000000000000000000000000) Nil!15438) Nil!15438)))))

(declare-fun b!818224 () Bool)

(declare-fun e!454197 () Bool)

(declare-fun contains!4136 (List!15441 (_ BitVec 64)) Bool)

(assert (=> b!818224 (= e!454197 (contains!4136 Nil!15438 (select (arr!21651 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818226 () Bool)

(declare-fun e!454196 () Bool)

(declare-fun e!454198 () Bool)

(assert (=> b!818226 (= e!454196 e!454198)))

(declare-fun res!558480 () Bool)

(assert (=> b!818226 (=> (not res!558480) (not e!454198))))

(assert (=> b!818226 (= res!558480 (not e!454197))))

(declare-fun res!558479 () Bool)

(assert (=> b!818226 (=> (not res!558479) (not e!454197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!818226 (= res!558479 (validKeyInArray!0 (select (arr!21651 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818227 () Bool)

(assert (=> b!818227 (= e!454198 e!454195)))

(assert (=> b!818227 (= c!89015 (validKeyInArray!0 (select (arr!21651 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104421 () Bool)

(declare-fun res!558481 () Bool)

(assert (=> d!104421 (=> res!558481 e!454196)))

(assert (=> d!104421 (= res!558481 (bvsge #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(assert (=> d!104421 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15438) e!454196)))

(declare-fun b!818225 () Bool)

(assert (=> b!818225 (= e!454195 call!35582)))

(assert (= (and d!104421 (not res!558481)) b!818226))

(assert (= (and b!818226 res!558479) b!818224))

(assert (= (and b!818226 res!558480) b!818227))

(assert (= (and b!818227 c!89015) b!818223))

(assert (= (and b!818227 (not c!89015)) b!818225))

(assert (= (or b!818223 b!818225) bm!35579))

(declare-fun m!759133 () Bool)

(assert (=> bm!35579 m!759133))

(declare-fun m!759135 () Bool)

(assert (=> bm!35579 m!759135))

(assert (=> b!818224 m!759133))

(assert (=> b!818224 m!759133))

(declare-fun m!759137 () Bool)

(assert (=> b!818224 m!759137))

(assert (=> b!818226 m!759133))

(assert (=> b!818226 m!759133))

(declare-fun m!759139 () Bool)

(assert (=> b!818226 m!759139))

(assert (=> b!818227 m!759133))

(assert (=> b!818227 m!759133))

(assert (=> b!818227 m!759139))

(assert (=> b!818160 d!104421))

(declare-fun d!104423 () Bool)

(assert (=> d!104423 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70436 d!104423))

(declare-fun d!104425 () Bool)

(assert (=> d!104425 (= (array_inv!17383 _keys!976) (bvsge (size!22072 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70436 d!104425))

(declare-fun d!104427 () Bool)

(assert (=> d!104427 (= (array_inv!17384 _values!788) (bvsge (size!22073 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70436 d!104427))

(declare-fun d!104429 () Bool)

(assert (=> d!104429 (= (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366496 () Unit!27886)

(declare-fun choose!1401 (array!45191 array!45193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24347 V!24347 V!24347 V!24347 (_ BitVec 32) Int) Unit!27886)

(assert (=> d!104429 (= lt!366496 (choose!1401 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104429 (validMask!0 mask!1312)))

(assert (=> d!104429 (= (lemmaNoChangeToArrayThenSameMapNoExtras!382 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366496)))

(declare-fun bs!22780 () Bool)

(assert (= bs!22780 d!104429))

(assert (=> bs!22780 m!759091))

(assert (=> bs!22780 m!759089))

(declare-fun m!759141 () Bool)

(assert (=> bs!22780 m!759141))

(assert (=> bs!22780 m!759073))

(assert (=> b!818161 d!104429))

(declare-fun b!818252 () Bool)

(declare-fun e!454213 () ListLongMap!8431)

(assert (=> b!818252 (= e!454213 (ListLongMap!8432 Nil!15439))))

(declare-fun b!818253 () Bool)

(declare-fun e!454216 () Bool)

(declare-fun lt!366515 () ListLongMap!8431)

(declare-fun isEmpty!640 (ListLongMap!8431) Bool)

(assert (=> b!818253 (= e!454216 (isEmpty!640 lt!366515))))

(declare-fun b!818254 () Bool)

(assert (=> b!818254 (= e!454216 (= lt!366515 (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!818255 () Bool)

(declare-fun e!454217 () Bool)

(declare-fun e!454218 () Bool)

(assert (=> b!818255 (= e!454217 e!454218)))

(declare-fun c!89026 () Bool)

(declare-fun e!454214 () Bool)

(assert (=> b!818255 (= c!89026 e!454214)))

(declare-fun res!558491 () Bool)

(assert (=> b!818255 (=> (not res!558491) (not e!454214))))

(assert (=> b!818255 (= res!558491 (bvslt #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(declare-fun call!35585 () ListLongMap!8431)

(declare-fun bm!35582 () Bool)

(assert (=> bm!35582 (= call!35585 (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!818256 () Bool)

(declare-fun lt!366511 () Unit!27886)

(declare-fun lt!366517 () Unit!27886)

(assert (=> b!818256 (= lt!366511 lt!366517)))

(declare-fun lt!366514 () (_ BitVec 64))

(declare-fun lt!366516 () V!24347)

(declare-fun lt!366513 () ListLongMap!8431)

(declare-fun lt!366512 () (_ BitVec 64))

(declare-fun contains!4137 (ListLongMap!8431 (_ BitVec 64)) Bool)

(declare-fun +!1855 (ListLongMap!8431 tuple2!9618) ListLongMap!8431)

(assert (=> b!818256 (not (contains!4137 (+!1855 lt!366513 (tuple2!9619 lt!366512 lt!366516)) lt!366514))))

(declare-fun addStillNotContains!179 (ListLongMap!8431 (_ BitVec 64) V!24347 (_ BitVec 64)) Unit!27886)

(assert (=> b!818256 (= lt!366517 (addStillNotContains!179 lt!366513 lt!366512 lt!366516 lt!366514))))

(assert (=> b!818256 (= lt!366514 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11572 (ValueCell!6839 V!24347) V!24347)

(declare-fun dynLambda!967 (Int (_ BitVec 64)) V!24347)

(assert (=> b!818256 (= lt!366516 (get!11572 (select (arr!21652 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!818256 (= lt!366512 (select (arr!21651 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!818256 (= lt!366513 call!35585)))

(declare-fun e!454219 () ListLongMap!8431)

(assert (=> b!818256 (= e!454219 (+!1855 call!35585 (tuple2!9619 (select (arr!21651 _keys!976) #b00000000000000000000000000000000) (get!11572 (select (arr!21652 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!818257 () Bool)

(assert (=> b!818257 (= e!454214 (validKeyInArray!0 (select (arr!21651 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818257 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!818258 () Bool)

(declare-fun res!558493 () Bool)

(assert (=> b!818258 (=> (not res!558493) (not e!454217))))

(assert (=> b!818258 (= res!558493 (not (contains!4137 lt!366515 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!818260 () Bool)

(assert (=> b!818260 (= e!454213 e!454219)))

(declare-fun c!89024 () Bool)

(assert (=> b!818260 (= c!89024 (validKeyInArray!0 (select (arr!21651 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818261 () Bool)

(assert (=> b!818261 (= e!454218 e!454216)))

(declare-fun c!89025 () Bool)

(assert (=> b!818261 (= c!89025 (bvslt #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(declare-fun b!818262 () Bool)

(assert (=> b!818262 (= e!454219 call!35585)))

(declare-fun b!818263 () Bool)

(declare-fun e!454215 () Bool)

(assert (=> b!818263 (= e!454218 e!454215)))

(assert (=> b!818263 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(declare-fun res!558492 () Bool)

(assert (=> b!818263 (= res!558492 (contains!4137 lt!366515 (select (arr!21651 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818263 (=> (not res!558492) (not e!454215))))

(declare-fun d!104431 () Bool)

(assert (=> d!104431 e!454217))

(declare-fun res!558490 () Bool)

(assert (=> d!104431 (=> (not res!558490) (not e!454217))))

(assert (=> d!104431 (= res!558490 (not (contains!4137 lt!366515 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104431 (= lt!366515 e!454213)))

(declare-fun c!89027 () Bool)

(assert (=> d!104431 (= c!89027 (bvsge #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(assert (=> d!104431 (validMask!0 mask!1312)))

(assert (=> d!104431 (= (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366515)))

(declare-fun b!818259 () Bool)

(assert (=> b!818259 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(assert (=> b!818259 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22073 _values!788)))))

(declare-fun apply!353 (ListLongMap!8431 (_ BitVec 64)) V!24347)

(assert (=> b!818259 (= e!454215 (= (apply!353 lt!366515 (select (arr!21651 _keys!976) #b00000000000000000000000000000000)) (get!11572 (select (arr!21652 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!104431 c!89027) b!818252))

(assert (= (and d!104431 (not c!89027)) b!818260))

(assert (= (and b!818260 c!89024) b!818256))

(assert (= (and b!818260 (not c!89024)) b!818262))

(assert (= (or b!818256 b!818262) bm!35582))

(assert (= (and d!104431 res!558490) b!818258))

(assert (= (and b!818258 res!558493) b!818255))

(assert (= (and b!818255 res!558491) b!818257))

(assert (= (and b!818255 c!89026) b!818263))

(assert (= (and b!818255 (not c!89026)) b!818261))

(assert (= (and b!818263 res!558492) b!818259))

(assert (= (and b!818261 c!89025) b!818254))

(assert (= (and b!818261 (not c!89025)) b!818253))

(declare-fun b_lambda!10909 () Bool)

(assert (=> (not b_lambda!10909) (not b!818256)))

(declare-fun t!21766 () Bool)

(declare-fun tb!4179 () Bool)

(assert (=> (and start!70436 (= defaultEntry!796 defaultEntry!796) t!21766) tb!4179))

(declare-fun result!7893 () Bool)

(assert (=> tb!4179 (= result!7893 tp_is_empty!14509)))

(assert (=> b!818256 t!21766))

(declare-fun b_and!21599 () Bool)

(assert (= b_and!21593 (and (=> t!21766 result!7893) b_and!21599)))

(declare-fun b_lambda!10911 () Bool)

(assert (=> (not b_lambda!10911) (not b!818259)))

(assert (=> b!818259 t!21766))

(declare-fun b_and!21601 () Bool)

(assert (= b_and!21599 (and (=> t!21766 result!7893) b_and!21601)))

(assert (=> b!818260 m!759133))

(assert (=> b!818260 m!759133))

(assert (=> b!818260 m!759139))

(declare-fun m!759143 () Bool)

(assert (=> b!818256 m!759143))

(declare-fun m!759145 () Bool)

(assert (=> b!818256 m!759145))

(declare-fun m!759147 () Bool)

(assert (=> b!818256 m!759147))

(declare-fun m!759149 () Bool)

(assert (=> b!818256 m!759149))

(assert (=> b!818256 m!759133))

(assert (=> b!818256 m!759149))

(declare-fun m!759151 () Bool)

(assert (=> b!818256 m!759151))

(declare-fun m!759153 () Bool)

(assert (=> b!818256 m!759153))

(assert (=> b!818256 m!759151))

(assert (=> b!818256 m!759145))

(declare-fun m!759155 () Bool)

(assert (=> b!818256 m!759155))

(declare-fun m!759157 () Bool)

(assert (=> b!818254 m!759157))

(assert (=> b!818257 m!759133))

(assert (=> b!818257 m!759133))

(assert (=> b!818257 m!759139))

(declare-fun m!759159 () Bool)

(assert (=> b!818258 m!759159))

(assert (=> bm!35582 m!759157))

(assert (=> b!818259 m!759149))

(assert (=> b!818259 m!759133))

(assert (=> b!818259 m!759149))

(assert (=> b!818259 m!759151))

(assert (=> b!818259 m!759153))

(assert (=> b!818259 m!759133))

(declare-fun m!759161 () Bool)

(assert (=> b!818259 m!759161))

(assert (=> b!818259 m!759151))

(assert (=> b!818263 m!759133))

(assert (=> b!818263 m!759133))

(declare-fun m!759163 () Bool)

(assert (=> b!818263 m!759163))

(declare-fun m!759165 () Bool)

(assert (=> d!104431 m!759165))

(assert (=> d!104431 m!759073))

(declare-fun m!759167 () Bool)

(assert (=> b!818253 m!759167))

(assert (=> b!818161 d!104431))

(declare-fun b!818266 () Bool)

(declare-fun e!454220 () ListLongMap!8431)

(assert (=> b!818266 (= e!454220 (ListLongMap!8432 Nil!15439))))

(declare-fun b!818267 () Bool)

(declare-fun e!454223 () Bool)

(declare-fun lt!366522 () ListLongMap!8431)

(assert (=> b!818267 (= e!454223 (isEmpty!640 lt!366522))))

(declare-fun b!818268 () Bool)

(assert (=> b!818268 (= e!454223 (= lt!366522 (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!818269 () Bool)

(declare-fun e!454224 () Bool)

(declare-fun e!454225 () Bool)

(assert (=> b!818269 (= e!454224 e!454225)))

(declare-fun c!89030 () Bool)

(declare-fun e!454221 () Bool)

(assert (=> b!818269 (= c!89030 e!454221)))

(declare-fun res!558495 () Bool)

(assert (=> b!818269 (=> (not res!558495) (not e!454221))))

(assert (=> b!818269 (= res!558495 (bvslt #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(declare-fun call!35586 () ListLongMap!8431)

(declare-fun bm!35583 () Bool)

(assert (=> bm!35583 (= call!35586 (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!818270 () Bool)

(declare-fun lt!366518 () Unit!27886)

(declare-fun lt!366524 () Unit!27886)

(assert (=> b!818270 (= lt!366518 lt!366524)))

(declare-fun lt!366519 () (_ BitVec 64))

(declare-fun lt!366520 () ListLongMap!8431)

(declare-fun lt!366521 () (_ BitVec 64))

(declare-fun lt!366523 () V!24347)

(assert (=> b!818270 (not (contains!4137 (+!1855 lt!366520 (tuple2!9619 lt!366519 lt!366523)) lt!366521))))

(assert (=> b!818270 (= lt!366524 (addStillNotContains!179 lt!366520 lt!366519 lt!366523 lt!366521))))

(assert (=> b!818270 (= lt!366521 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!818270 (= lt!366523 (get!11572 (select (arr!21652 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!818270 (= lt!366519 (select (arr!21651 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!818270 (= lt!366520 call!35586)))

(declare-fun e!454226 () ListLongMap!8431)

(assert (=> b!818270 (= e!454226 (+!1855 call!35586 (tuple2!9619 (select (arr!21651 _keys!976) #b00000000000000000000000000000000) (get!11572 (select (arr!21652 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!818271 () Bool)

(assert (=> b!818271 (= e!454221 (validKeyInArray!0 (select (arr!21651 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818271 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!818272 () Bool)

(declare-fun res!558497 () Bool)

(assert (=> b!818272 (=> (not res!558497) (not e!454224))))

(assert (=> b!818272 (= res!558497 (not (contains!4137 lt!366522 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!818274 () Bool)

(assert (=> b!818274 (= e!454220 e!454226)))

(declare-fun c!89028 () Bool)

(assert (=> b!818274 (= c!89028 (validKeyInArray!0 (select (arr!21651 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818275 () Bool)

(assert (=> b!818275 (= e!454225 e!454223)))

(declare-fun c!89029 () Bool)

(assert (=> b!818275 (= c!89029 (bvslt #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(declare-fun b!818276 () Bool)

(assert (=> b!818276 (= e!454226 call!35586)))

(declare-fun b!818277 () Bool)

(declare-fun e!454222 () Bool)

(assert (=> b!818277 (= e!454225 e!454222)))

(assert (=> b!818277 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(declare-fun res!558496 () Bool)

(assert (=> b!818277 (= res!558496 (contains!4137 lt!366522 (select (arr!21651 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818277 (=> (not res!558496) (not e!454222))))

(declare-fun d!104433 () Bool)

(assert (=> d!104433 e!454224))

(declare-fun res!558494 () Bool)

(assert (=> d!104433 (=> (not res!558494) (not e!454224))))

(assert (=> d!104433 (= res!558494 (not (contains!4137 lt!366522 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104433 (= lt!366522 e!454220)))

(declare-fun c!89031 () Bool)

(assert (=> d!104433 (= c!89031 (bvsge #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(assert (=> d!104433 (validMask!0 mask!1312)))

(assert (=> d!104433 (= (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366522)))

(declare-fun b!818273 () Bool)

(assert (=> b!818273 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(assert (=> b!818273 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22073 _values!788)))))

(assert (=> b!818273 (= e!454222 (= (apply!353 lt!366522 (select (arr!21651 _keys!976) #b00000000000000000000000000000000)) (get!11572 (select (arr!21652 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!104433 c!89031) b!818266))

(assert (= (and d!104433 (not c!89031)) b!818274))

(assert (= (and b!818274 c!89028) b!818270))

(assert (= (and b!818274 (not c!89028)) b!818276))

(assert (= (or b!818270 b!818276) bm!35583))

(assert (= (and d!104433 res!558494) b!818272))

(assert (= (and b!818272 res!558497) b!818269))

(assert (= (and b!818269 res!558495) b!818271))

(assert (= (and b!818269 c!89030) b!818277))

(assert (= (and b!818269 (not c!89030)) b!818275))

(assert (= (and b!818277 res!558496) b!818273))

(assert (= (and b!818275 c!89029) b!818268))

(assert (= (and b!818275 (not c!89029)) b!818267))

(declare-fun b_lambda!10913 () Bool)

(assert (=> (not b_lambda!10913) (not b!818270)))

(assert (=> b!818270 t!21766))

(declare-fun b_and!21603 () Bool)

(assert (= b_and!21601 (and (=> t!21766 result!7893) b_and!21603)))

(declare-fun b_lambda!10915 () Bool)

(assert (=> (not b_lambda!10915) (not b!818273)))

(assert (=> b!818273 t!21766))

(declare-fun b_and!21605 () Bool)

(assert (= b_and!21603 (and (=> t!21766 result!7893) b_and!21605)))

(assert (=> b!818274 m!759133))

(assert (=> b!818274 m!759133))

(assert (=> b!818274 m!759139))

(declare-fun m!759169 () Bool)

(assert (=> b!818270 m!759169))

(declare-fun m!759171 () Bool)

(assert (=> b!818270 m!759171))

(declare-fun m!759173 () Bool)

(assert (=> b!818270 m!759173))

(assert (=> b!818270 m!759149))

(assert (=> b!818270 m!759133))

(assert (=> b!818270 m!759149))

(assert (=> b!818270 m!759151))

(assert (=> b!818270 m!759153))

(assert (=> b!818270 m!759151))

(assert (=> b!818270 m!759171))

(declare-fun m!759175 () Bool)

(assert (=> b!818270 m!759175))

(declare-fun m!759177 () Bool)

(assert (=> b!818268 m!759177))

(assert (=> b!818271 m!759133))

(assert (=> b!818271 m!759133))

(assert (=> b!818271 m!759139))

(declare-fun m!759179 () Bool)

(assert (=> b!818272 m!759179))

(assert (=> bm!35583 m!759177))

(assert (=> b!818273 m!759149))

(assert (=> b!818273 m!759133))

(assert (=> b!818273 m!759149))

(assert (=> b!818273 m!759151))

(assert (=> b!818273 m!759153))

(assert (=> b!818273 m!759133))

(declare-fun m!759181 () Bool)

(assert (=> b!818273 m!759181))

(assert (=> b!818273 m!759151))

(assert (=> b!818277 m!759133))

(assert (=> b!818277 m!759133))

(declare-fun m!759183 () Bool)

(assert (=> b!818277 m!759183))

(declare-fun m!759185 () Bool)

(assert (=> d!104433 m!759185))

(assert (=> d!104433 m!759073))

(declare-fun m!759187 () Bool)

(assert (=> b!818267 m!759187))

(assert (=> b!818161 d!104433))

(declare-fun bm!35598 () Bool)

(declare-fun call!35607 () ListLongMap!8431)

(declare-fun call!35603 () ListLongMap!8431)

(assert (=> bm!35598 (= call!35607 call!35603)))

(declare-fun b!818320 () Bool)

(declare-fun e!454258 () Bool)

(assert (=> b!818320 (= e!454258 (validKeyInArray!0 (select (arr!21651 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818321 () Bool)

(declare-fun e!454264 () ListLongMap!8431)

(declare-fun e!454253 () ListLongMap!8431)

(assert (=> b!818321 (= e!454264 e!454253)))

(declare-fun c!89045 () Bool)

(assert (=> b!818321 (= c!89045 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!818322 () Bool)

(declare-fun e!454256 () Bool)

(declare-fun e!454260 () Bool)

(assert (=> b!818322 (= e!454256 e!454260)))

(declare-fun c!89046 () Bool)

(assert (=> b!818322 (= c!89046 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!818323 () Bool)

(declare-fun e!454261 () Unit!27886)

(declare-fun lt!366583 () Unit!27886)

(assert (=> b!818323 (= e!454261 lt!366583)))

(declare-fun lt!366573 () ListLongMap!8431)

(assert (=> b!818323 (= lt!366573 (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366578 () (_ BitVec 64))

(assert (=> b!818323 (= lt!366578 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366584 () (_ BitVec 64))

(assert (=> b!818323 (= lt!366584 (select (arr!21651 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366590 () Unit!27886)

(declare-fun addStillContains!307 (ListLongMap!8431 (_ BitVec 64) V!24347 (_ BitVec 64)) Unit!27886)

(assert (=> b!818323 (= lt!366590 (addStillContains!307 lt!366573 lt!366578 zeroValueBefore!34 lt!366584))))

(assert (=> b!818323 (contains!4137 (+!1855 lt!366573 (tuple2!9619 lt!366578 zeroValueBefore!34)) lt!366584)))

(declare-fun lt!366589 () Unit!27886)

(assert (=> b!818323 (= lt!366589 lt!366590)))

(declare-fun lt!366569 () ListLongMap!8431)

(assert (=> b!818323 (= lt!366569 (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366586 () (_ BitVec 64))

(assert (=> b!818323 (= lt!366586 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366587 () (_ BitVec 64))

(assert (=> b!818323 (= lt!366587 (select (arr!21651 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366580 () Unit!27886)

(declare-fun addApplyDifferent!307 (ListLongMap!8431 (_ BitVec 64) V!24347 (_ BitVec 64)) Unit!27886)

(assert (=> b!818323 (= lt!366580 (addApplyDifferent!307 lt!366569 lt!366586 minValue!754 lt!366587))))

(assert (=> b!818323 (= (apply!353 (+!1855 lt!366569 (tuple2!9619 lt!366586 minValue!754)) lt!366587) (apply!353 lt!366569 lt!366587))))

(declare-fun lt!366588 () Unit!27886)

(assert (=> b!818323 (= lt!366588 lt!366580)))

(declare-fun lt!366582 () ListLongMap!8431)

(assert (=> b!818323 (= lt!366582 (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366570 () (_ BitVec 64))

(assert (=> b!818323 (= lt!366570 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366575 () (_ BitVec 64))

(assert (=> b!818323 (= lt!366575 (select (arr!21651 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366581 () Unit!27886)

(assert (=> b!818323 (= lt!366581 (addApplyDifferent!307 lt!366582 lt!366570 zeroValueBefore!34 lt!366575))))

(assert (=> b!818323 (= (apply!353 (+!1855 lt!366582 (tuple2!9619 lt!366570 zeroValueBefore!34)) lt!366575) (apply!353 lt!366582 lt!366575))))

(declare-fun lt!366572 () Unit!27886)

(assert (=> b!818323 (= lt!366572 lt!366581)))

(declare-fun lt!366585 () ListLongMap!8431)

(assert (=> b!818323 (= lt!366585 (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366571 () (_ BitVec 64))

(assert (=> b!818323 (= lt!366571 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366574 () (_ BitVec 64))

(assert (=> b!818323 (= lt!366574 (select (arr!21651 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!818323 (= lt!366583 (addApplyDifferent!307 lt!366585 lt!366571 minValue!754 lt!366574))))

(assert (=> b!818323 (= (apply!353 (+!1855 lt!366585 (tuple2!9619 lt!366571 minValue!754)) lt!366574) (apply!353 lt!366585 lt!366574))))

(declare-fun bm!35599 () Bool)

(declare-fun call!35602 () Bool)

(declare-fun lt!366579 () ListLongMap!8431)

(assert (=> bm!35599 (= call!35602 (contains!4137 lt!366579 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!818324 () Bool)

(declare-fun res!558516 () Bool)

(assert (=> b!818324 (=> (not res!558516) (not e!454256))))

(declare-fun e!454259 () Bool)

(assert (=> b!818324 (= res!558516 e!454259)))

(declare-fun res!558519 () Bool)

(assert (=> b!818324 (=> res!558519 e!454259)))

(assert (=> b!818324 (= res!558519 (not e!454258))))

(declare-fun res!558523 () Bool)

(assert (=> b!818324 (=> (not res!558523) (not e!454258))))

(assert (=> b!818324 (= res!558523 (bvslt #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(declare-fun b!818325 () Bool)

(declare-fun e!454254 () Bool)

(assert (=> b!818325 (= e!454254 (= (apply!353 lt!366579 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!818326 () Bool)

(declare-fun e!454265 () Bool)

(assert (=> b!818326 (= e!454260 e!454265)))

(declare-fun res!558520 () Bool)

(assert (=> b!818326 (= res!558520 call!35602)))

(assert (=> b!818326 (=> (not res!558520) (not e!454265))))

(declare-fun b!818327 () Bool)

(declare-fun c!89048 () Bool)

(assert (=> b!818327 (= c!89048 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!454255 () ListLongMap!8431)

(assert (=> b!818327 (= e!454253 e!454255)))

(declare-fun b!818328 () Bool)

(declare-fun Unit!27892 () Unit!27886)

(assert (=> b!818328 (= e!454261 Unit!27892)))

(declare-fun b!818329 () Bool)

(assert (=> b!818329 (= e!454253 call!35607)))

(declare-fun b!818330 () Bool)

(declare-fun e!454257 () Bool)

(assert (=> b!818330 (= e!454257 (validKeyInArray!0 (select (arr!21651 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818331 () Bool)

(assert (=> b!818331 (= e!454260 (not call!35602))))

(declare-fun b!818332 () Bool)

(declare-fun e!454263 () Bool)

(assert (=> b!818332 (= e!454263 (= (apply!353 lt!366579 (select (arr!21651 _keys!976) #b00000000000000000000000000000000)) (get!11572 (select (arr!21652 _values!788) #b00000000000000000000000000000000) (dynLambda!967 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!818332 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22073 _values!788)))))

(assert (=> b!818332 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(declare-fun bm!35600 () Bool)

(declare-fun call!35601 () Bool)

(assert (=> bm!35600 (= call!35601 (contains!4137 lt!366579 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!35605 () ListLongMap!8431)

(declare-fun bm!35601 () Bool)

(declare-fun call!35604 () ListLongMap!8431)

(declare-fun c!89047 () Bool)

(declare-fun call!35606 () ListLongMap!8431)

(assert (=> bm!35601 (= call!35603 (+!1855 (ite c!89047 call!35605 (ite c!89045 call!35606 call!35604)) (ite (or c!89047 c!89045) (tuple2!9619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!818333 () Bool)

(declare-fun e!454262 () Bool)

(assert (=> b!818333 (= e!454262 (not call!35601))))

(declare-fun bm!35602 () Bool)

(assert (=> bm!35602 (= call!35605 (getCurrentListMapNoExtraKeys!2289 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818334 () Bool)

(assert (=> b!818334 (= e!454259 e!454263)))

(declare-fun res!558517 () Bool)

(assert (=> b!818334 (=> (not res!558517) (not e!454263))))

(assert (=> b!818334 (= res!558517 (contains!4137 lt!366579 (select (arr!21651 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818334 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(declare-fun b!818335 () Bool)

(declare-fun res!558522 () Bool)

(assert (=> b!818335 (=> (not res!558522) (not e!454256))))

(assert (=> b!818335 (= res!558522 e!454262)))

(declare-fun c!89049 () Bool)

(assert (=> b!818335 (= c!89049 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!818336 () Bool)

(assert (=> b!818336 (= e!454265 (= (apply!353 lt!366579 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!818337 () Bool)

(assert (=> b!818337 (= e!454255 call!35604)))

(declare-fun b!818338 () Bool)

(assert (=> b!818338 (= e!454264 (+!1855 call!35603 (tuple2!9619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35603 () Bool)

(assert (=> bm!35603 (= call!35606 call!35605)))

(declare-fun d!104435 () Bool)

(assert (=> d!104435 e!454256))

(declare-fun res!558518 () Bool)

(assert (=> d!104435 (=> (not res!558518) (not e!454256))))

(assert (=> d!104435 (= res!558518 (or (bvsge #b00000000000000000000000000000000 (size!22072 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22072 _keys!976)))))))

(declare-fun lt!366576 () ListLongMap!8431)

(assert (=> d!104435 (= lt!366579 lt!366576)))

(declare-fun lt!366577 () Unit!27886)

(assert (=> d!104435 (= lt!366577 e!454261)))

(declare-fun c!89044 () Bool)

(assert (=> d!104435 (= c!89044 e!454257)))

(declare-fun res!558524 () Bool)

(assert (=> d!104435 (=> (not res!558524) (not e!454257))))

(assert (=> d!104435 (= res!558524 (bvslt #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(assert (=> d!104435 (= lt!366576 e!454264)))

(assert (=> d!104435 (= c!89047 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104435 (validMask!0 mask!1312)))

(assert (=> d!104435 (= (getCurrentListMap!2382 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366579)))

(declare-fun bm!35604 () Bool)

(assert (=> bm!35604 (= call!35604 call!35606)))

(declare-fun b!818339 () Bool)

(assert (=> b!818339 (= e!454262 e!454254)))

(declare-fun res!558521 () Bool)

(assert (=> b!818339 (= res!558521 call!35601)))

(assert (=> b!818339 (=> (not res!558521) (not e!454254))))

(declare-fun b!818340 () Bool)

(assert (=> b!818340 (= e!454255 call!35607)))

(assert (= (and d!104435 c!89047) b!818338))

(assert (= (and d!104435 (not c!89047)) b!818321))

(assert (= (and b!818321 c!89045) b!818329))

(assert (= (and b!818321 (not c!89045)) b!818327))

(assert (= (and b!818327 c!89048) b!818340))

(assert (= (and b!818327 (not c!89048)) b!818337))

(assert (= (or b!818340 b!818337) bm!35604))

(assert (= (or b!818329 bm!35604) bm!35603))

(assert (= (or b!818329 b!818340) bm!35598))

(assert (= (or b!818338 bm!35603) bm!35602))

(assert (= (or b!818338 bm!35598) bm!35601))

(assert (= (and d!104435 res!558524) b!818330))

(assert (= (and d!104435 c!89044) b!818323))

(assert (= (and d!104435 (not c!89044)) b!818328))

(assert (= (and d!104435 res!558518) b!818324))

(assert (= (and b!818324 res!558523) b!818320))

(assert (= (and b!818324 (not res!558519)) b!818334))

(assert (= (and b!818334 res!558517) b!818332))

(assert (= (and b!818324 res!558516) b!818335))

(assert (= (and b!818335 c!89049) b!818339))

(assert (= (and b!818335 (not c!89049)) b!818333))

(assert (= (and b!818339 res!558521) b!818325))

(assert (= (or b!818339 b!818333) bm!35600))

(assert (= (and b!818335 res!558522) b!818322))

(assert (= (and b!818322 c!89046) b!818326))

(assert (= (and b!818322 (not c!89046)) b!818331))

(assert (= (and b!818326 res!558520) b!818336))

(assert (= (or b!818326 b!818331) bm!35599))

(declare-fun b_lambda!10917 () Bool)

(assert (=> (not b_lambda!10917) (not b!818332)))

(assert (=> b!818332 t!21766))

(declare-fun b_and!21607 () Bool)

(assert (= b_and!21605 (and (=> t!21766 result!7893) b_and!21607)))

(assert (=> b!818320 m!759133))

(assert (=> b!818320 m!759133))

(assert (=> b!818320 m!759139))

(assert (=> b!818334 m!759133))

(assert (=> b!818334 m!759133))

(declare-fun m!759189 () Bool)

(assert (=> b!818334 m!759189))

(declare-fun m!759191 () Bool)

(assert (=> b!818323 m!759191))

(declare-fun m!759193 () Bool)

(assert (=> b!818323 m!759193))

(declare-fun m!759195 () Bool)

(assert (=> b!818323 m!759195))

(assert (=> b!818323 m!759091))

(declare-fun m!759197 () Bool)

(assert (=> b!818323 m!759197))

(declare-fun m!759199 () Bool)

(assert (=> b!818323 m!759199))

(declare-fun m!759201 () Bool)

(assert (=> b!818323 m!759201))

(declare-fun m!759203 () Bool)

(assert (=> b!818323 m!759203))

(declare-fun m!759205 () Bool)

(assert (=> b!818323 m!759205))

(assert (=> b!818323 m!759133))

(declare-fun m!759207 () Bool)

(assert (=> b!818323 m!759207))

(declare-fun m!759209 () Bool)

(assert (=> b!818323 m!759209))

(assert (=> b!818323 m!759195))

(declare-fun m!759211 () Bool)

(assert (=> b!818323 m!759211))

(declare-fun m!759213 () Bool)

(assert (=> b!818323 m!759213))

(assert (=> b!818323 m!759203))

(assert (=> b!818323 m!759197))

(assert (=> b!818323 m!759193))

(declare-fun m!759215 () Bool)

(assert (=> b!818323 m!759215))

(declare-fun m!759217 () Bool)

(assert (=> b!818323 m!759217))

(declare-fun m!759219 () Bool)

(assert (=> b!818323 m!759219))

(assert (=> d!104435 m!759073))

(assert (=> b!818330 m!759133))

(assert (=> b!818330 m!759133))

(assert (=> b!818330 m!759139))

(declare-fun m!759221 () Bool)

(assert (=> bm!35600 m!759221))

(declare-fun m!759223 () Bool)

(assert (=> bm!35599 m!759223))

(declare-fun m!759225 () Bool)

(assert (=> bm!35601 m!759225))

(declare-fun m!759227 () Bool)

(assert (=> b!818338 m!759227))

(assert (=> b!818332 m!759133))

(assert (=> b!818332 m!759133))

(declare-fun m!759229 () Bool)

(assert (=> b!818332 m!759229))

(assert (=> b!818332 m!759151))

(assert (=> b!818332 m!759149))

(assert (=> b!818332 m!759149))

(assert (=> b!818332 m!759151))

(assert (=> b!818332 m!759153))

(declare-fun m!759231 () Bool)

(assert (=> b!818325 m!759231))

(declare-fun m!759233 () Bool)

(assert (=> b!818336 m!759233))

(assert (=> bm!35602 m!759091))

(assert (=> b!818163 d!104435))

(declare-fun b!818349 () Bool)

(declare-fun e!454274 () Bool)

(declare-fun call!35610 () Bool)

(assert (=> b!818349 (= e!454274 call!35610)))

(declare-fun d!104437 () Bool)

(declare-fun res!558530 () Bool)

(declare-fun e!454273 () Bool)

(assert (=> d!104437 (=> res!558530 e!454273)))

(assert (=> d!104437 (= res!558530 (bvsge #b00000000000000000000000000000000 (size!22072 _keys!976)))))

(assert (=> d!104437 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!454273)))

(declare-fun b!818350 () Bool)

(declare-fun e!454272 () Bool)

(assert (=> b!818350 (= e!454272 call!35610)))

(declare-fun bm!35607 () Bool)

(assert (=> bm!35607 (= call!35610 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!818351 () Bool)

(assert (=> b!818351 (= e!454272 e!454274)))

(declare-fun lt!366599 () (_ BitVec 64))

(assert (=> b!818351 (= lt!366599 (select (arr!21651 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366598 () Unit!27886)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45191 (_ BitVec 64) (_ BitVec 32)) Unit!27886)

(assert (=> b!818351 (= lt!366598 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!366599 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!818351 (arrayContainsKey!0 _keys!976 lt!366599 #b00000000000000000000000000000000)))

(declare-fun lt!366597 () Unit!27886)

(assert (=> b!818351 (= lt!366597 lt!366598)))

(declare-fun res!558529 () Bool)

(declare-datatypes ((SeekEntryResult!8721 0))(
  ( (MissingZero!8721 (index!37255 (_ BitVec 32))) (Found!8721 (index!37256 (_ BitVec 32))) (Intermediate!8721 (undefined!9533 Bool) (index!37257 (_ BitVec 32)) (x!68944 (_ BitVec 32))) (Undefined!8721) (MissingVacant!8721 (index!37258 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45191 (_ BitVec 32)) SeekEntryResult!8721)

(assert (=> b!818351 (= res!558529 (= (seekEntryOrOpen!0 (select (arr!21651 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8721 #b00000000000000000000000000000000)))))

(assert (=> b!818351 (=> (not res!558529) (not e!454274))))

(declare-fun b!818352 () Bool)

(assert (=> b!818352 (= e!454273 e!454272)))

(declare-fun c!89052 () Bool)

(assert (=> b!818352 (= c!89052 (validKeyInArray!0 (select (arr!21651 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104437 (not res!558530)) b!818352))

(assert (= (and b!818352 c!89052) b!818351))

(assert (= (and b!818352 (not c!89052)) b!818350))

(assert (= (and b!818351 res!558529) b!818349))

(assert (= (or b!818349 b!818350) bm!35607))

(declare-fun m!759235 () Bool)

(assert (=> bm!35607 m!759235))

(assert (=> b!818351 m!759133))

(declare-fun m!759237 () Bool)

(assert (=> b!818351 m!759237))

(declare-fun m!759239 () Bool)

(assert (=> b!818351 m!759239))

(assert (=> b!818351 m!759133))

(declare-fun m!759241 () Bool)

(assert (=> b!818351 m!759241))

(assert (=> b!818352 m!759133))

(assert (=> b!818352 m!759133))

(assert (=> b!818352 m!759139))

(assert (=> b!818164 d!104437))

(declare-fun condMapEmpty!23368 () Bool)

(declare-fun mapDefault!23368 () ValueCell!6839)

(assert (=> mapNonEmpty!23359 (= condMapEmpty!23368 (= mapRest!23359 ((as const (Array (_ BitVec 32) ValueCell!6839)) mapDefault!23368)))))

(declare-fun e!454279 () Bool)

(declare-fun mapRes!23368 () Bool)

(assert (=> mapNonEmpty!23359 (= tp!45127 (and e!454279 mapRes!23368))))

(declare-fun b!818359 () Bool)

(declare-fun e!454280 () Bool)

(assert (=> b!818359 (= e!454280 tp_is_empty!14509)))

(declare-fun mapNonEmpty!23368 () Bool)

(declare-fun tp!45142 () Bool)

(assert (=> mapNonEmpty!23368 (= mapRes!23368 (and tp!45142 e!454280))))

(declare-fun mapKey!23368 () (_ BitVec 32))

(declare-fun mapRest!23368 () (Array (_ BitVec 32) ValueCell!6839))

(declare-fun mapValue!23368 () ValueCell!6839)

(assert (=> mapNonEmpty!23368 (= mapRest!23359 (store mapRest!23368 mapKey!23368 mapValue!23368))))

(declare-fun mapIsEmpty!23368 () Bool)

(assert (=> mapIsEmpty!23368 mapRes!23368))

(declare-fun b!818360 () Bool)

(assert (=> b!818360 (= e!454279 tp_is_empty!14509)))

(assert (= (and mapNonEmpty!23359 condMapEmpty!23368) mapIsEmpty!23368))

(assert (= (and mapNonEmpty!23359 (not condMapEmpty!23368)) mapNonEmpty!23368))

(assert (= (and mapNonEmpty!23368 ((_ is ValueCellFull!6839) mapValue!23368)) b!818359))

(assert (= (and mapNonEmpty!23359 ((_ is ValueCellFull!6839) mapDefault!23368)) b!818360))

(declare-fun m!759243 () Bool)

(assert (=> mapNonEmpty!23368 m!759243))

(declare-fun b_lambda!10919 () Bool)

(assert (= b_lambda!10911 (or (and start!70436 b_free!12799) b_lambda!10919)))

(declare-fun b_lambda!10921 () Bool)

(assert (= b_lambda!10915 (or (and start!70436 b_free!12799) b_lambda!10921)))

(declare-fun b_lambda!10923 () Bool)

(assert (= b_lambda!10909 (or (and start!70436 b_free!12799) b_lambda!10923)))

(declare-fun b_lambda!10925 () Bool)

(assert (= b_lambda!10917 (or (and start!70436 b_free!12799) b_lambda!10925)))

(declare-fun b_lambda!10927 () Bool)

(assert (= b_lambda!10913 (or (and start!70436 b_free!12799) b_lambda!10927)))

(check-sat (not bm!35599) (not mapNonEmpty!23368) (not b!818277) (not b_lambda!10925) (not b!818257) (not b!818332) (not b_lambda!10927) (not b!818351) (not b!818320) (not b!818226) (not bm!35582) (not b!818259) (not b!818260) (not b!818253) (not bm!35607) (not b!818268) (not b!818274) (not b_next!12799) (not b!818256) (not bm!35600) (not b!818263) (not bm!35601) tp_is_empty!14509 (not b!818338) (not d!104429) (not b!818323) (not d!104435) (not d!104433) (not b!818224) (not b_lambda!10919) b_and!21607 (not d!104431) (not b!818227) (not b!818330) (not b!818334) (not b!818258) (not b!818254) (not b!818272) (not bm!35602) (not b_lambda!10921) (not b!818352) (not b!818271) (not b_lambda!10923) (not b!818267) (not b!818273) (not b!818325) (not b!818270) (not bm!35579) (not b!818336) (not bm!35583))
(check-sat b_and!21607 (not b_next!12799))
