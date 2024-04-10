; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69848 () Bool)

(assert start!69848)

(declare-fun b!812258 () Bool)

(declare-fun e!449851 () Bool)

(declare-datatypes ((List!15093 0))(
  ( (Nil!15090) (Cons!15089 (h!16218 (_ BitVec 64)) (t!21408 List!15093)) )
))
(declare-fun contains!4141 (List!15093 (_ BitVec 64)) Bool)

(assert (=> b!812258 (= e!449851 (contains!4141 Nil!15090 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!812259 () Bool)

(declare-fun e!449849 () Bool)

(assert (=> b!812259 (= e!449849 e!449851)))

(declare-fun res!555078 () Bool)

(assert (=> b!812259 (=> res!555078 e!449851)))

(assert (=> b!812259 (= res!555078 (contains!4141 Nil!15090 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!22591 () Bool)

(declare-fun mapRes!22591 () Bool)

(declare-fun tp!43699 () Bool)

(declare-fun e!449846 () Bool)

(assert (=> mapNonEmpty!22591 (= mapRes!22591 (and tp!43699 e!449846))))

(declare-fun mapKey!22591 () (_ BitVec 32))

(declare-datatypes ((V!23685 0))(
  ( (V!23686 (val!7054 Int)) )
))
(declare-datatypes ((ValueCell!6591 0))(
  ( (ValueCellFull!6591 (v!9480 V!23685)) (EmptyCell!6591) )
))
(declare-fun mapRest!22591 () (Array (_ BitVec 32) ValueCell!6591))

(declare-datatypes ((array!44252 0))(
  ( (array!44253 (arr!21189 (Array (_ BitVec 32) ValueCell!6591)) (size!21610 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44252)

(declare-fun mapValue!22591 () ValueCell!6591)

(assert (=> mapNonEmpty!22591 (= (arr!21189 _values!788) (store mapRest!22591 mapKey!22591 mapValue!22591))))

(declare-fun b!812260 () Bool)

(declare-fun tp_is_empty!14013 () Bool)

(assert (=> b!812260 (= e!449846 tp_is_empty!14013)))

(declare-fun b!812261 () Bool)

(declare-fun res!555080 () Bool)

(assert (=> b!812261 (=> (not res!555080) (not e!449849))))

(declare-datatypes ((array!44254 0))(
  ( (array!44255 (arr!21190 (Array (_ BitVec 32) (_ BitVec 64))) (size!21611 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44254)

(assert (=> b!812261 (= res!555080 (and (bvsle #b00000000000000000000000000000000 (size!21611 _keys!976)) (bvslt (size!21611 _keys!976) #b01111111111111111111111111111111)))))

(declare-fun res!555081 () Bool)

(assert (=> start!69848 (=> (not res!555081) (not e!449849))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69848 (= res!555081 (validMask!0 mask!1312))))

(assert (=> start!69848 e!449849))

(declare-fun array_inv!16977 (array!44254) Bool)

(assert (=> start!69848 (array_inv!16977 _keys!976)))

(assert (=> start!69848 true))

(declare-fun e!449847 () Bool)

(declare-fun array_inv!16978 (array!44252) Bool)

(assert (=> start!69848 (and (array_inv!16978 _values!788) e!449847)))

(declare-fun b!812262 () Bool)

(declare-fun e!449848 () Bool)

(assert (=> b!812262 (= e!449847 (and e!449848 mapRes!22591))))

(declare-fun condMapEmpty!22591 () Bool)

(declare-fun mapDefault!22591 () ValueCell!6591)

(assert (=> b!812262 (= condMapEmpty!22591 (= (arr!21189 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6591)) mapDefault!22591)))))

(declare-fun mapIsEmpty!22591 () Bool)

(assert (=> mapIsEmpty!22591 mapRes!22591))

(declare-fun b!812263 () Bool)

(declare-fun res!555079 () Bool)

(assert (=> b!812263 (=> (not res!555079) (not e!449849))))

(declare-fun noDuplicate!1294 (List!15093) Bool)

(assert (=> b!812263 (= res!555079 (noDuplicate!1294 Nil!15090))))

(declare-fun b!812264 () Bool)

(assert (=> b!812264 (= e!449848 tp_is_empty!14013)))

(declare-fun b!812265 () Bool)

(declare-fun res!555077 () Bool)

(assert (=> b!812265 (=> (not res!555077) (not e!449849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44254 (_ BitVec 32)) Bool)

(assert (=> b!812265 (= res!555077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812266 () Bool)

(declare-fun res!555082 () Bool)

(assert (=> b!812266 (=> (not res!555082) (not e!449849))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812266 (= res!555082 (and (= (size!21610 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21611 _keys!976) (size!21610 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!69848 res!555081) b!812266))

(assert (= (and b!812266 res!555082) b!812265))

(assert (= (and b!812265 res!555077) b!812261))

(assert (= (and b!812261 res!555080) b!812263))

(assert (= (and b!812263 res!555079) b!812259))

(assert (= (and b!812259 (not res!555078)) b!812258))

(assert (= (and b!812262 condMapEmpty!22591) mapIsEmpty!22591))

(assert (= (and b!812262 (not condMapEmpty!22591)) mapNonEmpty!22591))

(get-info :version)

(assert (= (and mapNonEmpty!22591 ((_ is ValueCellFull!6591) mapValue!22591)) b!812260))

(assert (= (and b!812262 ((_ is ValueCellFull!6591) mapDefault!22591)) b!812264))

(assert (= start!69848 b!812262))

(declare-fun m!754701 () Bool)

(assert (=> b!812265 m!754701))

(declare-fun m!754703 () Bool)

(assert (=> mapNonEmpty!22591 m!754703))

(declare-fun m!754705 () Bool)

(assert (=> start!69848 m!754705))

(declare-fun m!754707 () Bool)

(assert (=> start!69848 m!754707))

(declare-fun m!754709 () Bool)

(assert (=> start!69848 m!754709))

(declare-fun m!754711 () Bool)

(assert (=> b!812263 m!754711))

(declare-fun m!754713 () Bool)

(assert (=> b!812258 m!754713))

(declare-fun m!754715 () Bool)

(assert (=> b!812259 m!754715))

(check-sat tp_is_empty!14013 (not start!69848) (not mapNonEmpty!22591) (not b!812265) (not b!812259) (not b!812258) (not b!812263))
(check-sat)
(get-model)

(declare-fun d!104323 () Bool)

(declare-fun lt!364109 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!385 (List!15093) (InoxSet (_ BitVec 64)))

(assert (=> d!104323 (= lt!364109 (select (content!385 Nil!15090) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!449875 () Bool)

(assert (=> d!104323 (= lt!364109 e!449875)))

(declare-fun res!555105 () Bool)

(assert (=> d!104323 (=> (not res!555105) (not e!449875))))

(assert (=> d!104323 (= res!555105 ((_ is Cons!15089) Nil!15090))))

(assert (=> d!104323 (= (contains!4141 Nil!15090 #b0000000000000000000000000000000000000000000000000000000000000000) lt!364109)))

(declare-fun b!812298 () Bool)

(declare-fun e!449874 () Bool)

(assert (=> b!812298 (= e!449875 e!449874)))

(declare-fun res!555106 () Bool)

(assert (=> b!812298 (=> res!555106 e!449874)))

(assert (=> b!812298 (= res!555106 (= (h!16218 Nil!15090) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!812299 () Bool)

(assert (=> b!812299 (= e!449874 (contains!4141 (t!21408 Nil!15090) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!104323 res!555105) b!812298))

(assert (= (and b!812298 (not res!555106)) b!812299))

(declare-fun m!754733 () Bool)

(assert (=> d!104323 m!754733))

(declare-fun m!754735 () Bool)

(assert (=> d!104323 m!754735))

(declare-fun m!754737 () Bool)

(assert (=> b!812299 m!754737))

(assert (=> b!812259 d!104323))

(declare-fun d!104325 () Bool)

(declare-fun lt!364110 () Bool)

(assert (=> d!104325 (= lt!364110 (select (content!385 Nil!15090) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!449877 () Bool)

(assert (=> d!104325 (= lt!364110 e!449877)))

(declare-fun res!555107 () Bool)

(assert (=> d!104325 (=> (not res!555107) (not e!449877))))

(assert (=> d!104325 (= res!555107 ((_ is Cons!15089) Nil!15090))))

(assert (=> d!104325 (= (contains!4141 Nil!15090 #b1000000000000000000000000000000000000000000000000000000000000000) lt!364110)))

(declare-fun b!812300 () Bool)

(declare-fun e!449876 () Bool)

(assert (=> b!812300 (= e!449877 e!449876)))

(declare-fun res!555108 () Bool)

(assert (=> b!812300 (=> res!555108 e!449876)))

(assert (=> b!812300 (= res!555108 (= (h!16218 Nil!15090) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!812301 () Bool)

(assert (=> b!812301 (= e!449876 (contains!4141 (t!21408 Nil!15090) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!104325 res!555107) b!812300))

(assert (= (and b!812300 (not res!555108)) b!812301))

(assert (=> d!104325 m!754733))

(declare-fun m!754739 () Bool)

(assert (=> d!104325 m!754739))

(declare-fun m!754741 () Bool)

(assert (=> b!812301 m!754741))

(assert (=> b!812258 d!104325))

(declare-fun d!104327 () Bool)

(declare-fun res!555113 () Bool)

(declare-fun e!449885 () Bool)

(assert (=> d!104327 (=> res!555113 e!449885)))

(assert (=> d!104327 (= res!555113 (bvsge #b00000000000000000000000000000000 (size!21611 _keys!976)))))

(assert (=> d!104327 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!449885)))

(declare-fun b!812310 () Bool)

(declare-fun e!449886 () Bool)

(declare-fun call!35484 () Bool)

(assert (=> b!812310 (= e!449886 call!35484)))

(declare-fun b!812311 () Bool)

(declare-fun e!449884 () Bool)

(assert (=> b!812311 (= e!449884 call!35484)))

(declare-fun b!812312 () Bool)

(assert (=> b!812312 (= e!449885 e!449886)))

(declare-fun c!88900 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!812312 (= c!88900 (validKeyInArray!0 (select (arr!21190 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35481 () Bool)

(assert (=> bm!35481 (= call!35484 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!812313 () Bool)

(assert (=> b!812313 (= e!449886 e!449884)))

(declare-fun lt!364119 () (_ BitVec 64))

(assert (=> b!812313 (= lt!364119 (select (arr!21190 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27708 0))(
  ( (Unit!27709) )
))
(declare-fun lt!364118 () Unit!27708)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44254 (_ BitVec 64) (_ BitVec 32)) Unit!27708)

(assert (=> b!812313 (= lt!364118 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!364119 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!812313 (arrayContainsKey!0 _keys!976 lt!364119 #b00000000000000000000000000000000)))

(declare-fun lt!364117 () Unit!27708)

(assert (=> b!812313 (= lt!364117 lt!364118)))

(declare-fun res!555114 () Bool)

(declare-datatypes ((SeekEntryResult!8717 0))(
  ( (MissingZero!8717 (index!37239 (_ BitVec 32))) (Found!8717 (index!37240 (_ BitVec 32))) (Intermediate!8717 (undefined!9529 Bool) (index!37241 (_ BitVec 32)) (x!68202 (_ BitVec 32))) (Undefined!8717) (MissingVacant!8717 (index!37242 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44254 (_ BitVec 32)) SeekEntryResult!8717)

(assert (=> b!812313 (= res!555114 (= (seekEntryOrOpen!0 (select (arr!21190 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8717 #b00000000000000000000000000000000)))))

(assert (=> b!812313 (=> (not res!555114) (not e!449884))))

(assert (= (and d!104327 (not res!555113)) b!812312))

(assert (= (and b!812312 c!88900) b!812313))

(assert (= (and b!812312 (not c!88900)) b!812310))

(assert (= (and b!812313 res!555114) b!812311))

(assert (= (or b!812311 b!812310) bm!35481))

(declare-fun m!754743 () Bool)

(assert (=> b!812312 m!754743))

(assert (=> b!812312 m!754743))

(declare-fun m!754745 () Bool)

(assert (=> b!812312 m!754745))

(declare-fun m!754747 () Bool)

(assert (=> bm!35481 m!754747))

(assert (=> b!812313 m!754743))

(declare-fun m!754749 () Bool)

(assert (=> b!812313 m!754749))

(declare-fun m!754751 () Bool)

(assert (=> b!812313 m!754751))

(assert (=> b!812313 m!754743))

(declare-fun m!754753 () Bool)

(assert (=> b!812313 m!754753))

(assert (=> b!812265 d!104327))

(declare-fun d!104329 () Bool)

(assert (=> d!104329 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69848 d!104329))

(declare-fun d!104331 () Bool)

(assert (=> d!104331 (= (array_inv!16977 _keys!976) (bvsge (size!21611 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69848 d!104331))

(declare-fun d!104333 () Bool)

(assert (=> d!104333 (= (array_inv!16978 _values!788) (bvsge (size!21610 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69848 d!104333))

(declare-fun d!104335 () Bool)

(declare-fun res!555119 () Bool)

(declare-fun e!449891 () Bool)

(assert (=> d!104335 (=> res!555119 e!449891)))

(assert (=> d!104335 (= res!555119 ((_ is Nil!15090) Nil!15090))))

(assert (=> d!104335 (= (noDuplicate!1294 Nil!15090) e!449891)))

(declare-fun b!812318 () Bool)

(declare-fun e!449892 () Bool)

(assert (=> b!812318 (= e!449891 e!449892)))

(declare-fun res!555120 () Bool)

(assert (=> b!812318 (=> (not res!555120) (not e!449892))))

(assert (=> b!812318 (= res!555120 (not (contains!4141 (t!21408 Nil!15090) (h!16218 Nil!15090))))))

(declare-fun b!812319 () Bool)

(assert (=> b!812319 (= e!449892 (noDuplicate!1294 (t!21408 Nil!15090)))))

(assert (= (and d!104335 (not res!555119)) b!812318))

(assert (= (and b!812318 res!555120) b!812319))

(declare-fun m!754755 () Bool)

(assert (=> b!812318 m!754755))

(declare-fun m!754757 () Bool)

(assert (=> b!812319 m!754757))

(assert (=> b!812263 d!104335))

(declare-fun mapNonEmpty!22597 () Bool)

(declare-fun mapRes!22597 () Bool)

(declare-fun tp!43705 () Bool)

(declare-fun e!449897 () Bool)

(assert (=> mapNonEmpty!22597 (= mapRes!22597 (and tp!43705 e!449897))))

(declare-fun mapRest!22597 () (Array (_ BitVec 32) ValueCell!6591))

(declare-fun mapValue!22597 () ValueCell!6591)

(declare-fun mapKey!22597 () (_ BitVec 32))

(assert (=> mapNonEmpty!22597 (= mapRest!22591 (store mapRest!22597 mapKey!22597 mapValue!22597))))

(declare-fun condMapEmpty!22597 () Bool)

(declare-fun mapDefault!22597 () ValueCell!6591)

(assert (=> mapNonEmpty!22591 (= condMapEmpty!22597 (= mapRest!22591 ((as const (Array (_ BitVec 32) ValueCell!6591)) mapDefault!22597)))))

(declare-fun e!449898 () Bool)

(assert (=> mapNonEmpty!22591 (= tp!43699 (and e!449898 mapRes!22597))))

(declare-fun mapIsEmpty!22597 () Bool)

(assert (=> mapIsEmpty!22597 mapRes!22597))

(declare-fun b!812327 () Bool)

(assert (=> b!812327 (= e!449898 tp_is_empty!14013)))

(declare-fun b!812326 () Bool)

(assert (=> b!812326 (= e!449897 tp_is_empty!14013)))

(assert (= (and mapNonEmpty!22591 condMapEmpty!22597) mapIsEmpty!22597))

(assert (= (and mapNonEmpty!22591 (not condMapEmpty!22597)) mapNonEmpty!22597))

(assert (= (and mapNonEmpty!22597 ((_ is ValueCellFull!6591) mapValue!22597)) b!812326))

(assert (= (and mapNonEmpty!22591 ((_ is ValueCellFull!6591) mapDefault!22597)) b!812327))

(declare-fun m!754759 () Bool)

(assert (=> mapNonEmpty!22597 m!754759))

(check-sat (not b!812319) (not b!812318) (not d!104323) (not b!812299) (not b!812313) tp_is_empty!14013 (not b!812312) (not d!104325) (not mapNonEmpty!22597) (not b!812301) (not bm!35481))
(check-sat)
