; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35936 () Bool)

(assert start!35936)

(declare-fun b!361194 () Bool)

(declare-fun e!221159 () Bool)

(declare-datatypes ((List!5413 0))(
  ( (Nil!5410) (Cons!5409 (h!6265 (_ BitVec 64)) (t!10555 List!5413)) )
))
(declare-fun noDuplicate!184 (List!5413) Bool)

(assert (=> b!361194 (= e!221159 (not (noDuplicate!184 Nil!5410)))))

(declare-fun b!361195 () Bool)

(declare-fun e!221161 () Bool)

(declare-fun tp_is_empty!8365 () Bool)

(assert (=> b!361195 (= e!221161 tp_is_empty!8365)))

(declare-fun b!361196 () Bool)

(declare-fun res!200951 () Bool)

(assert (=> b!361196 (=> (not res!200951) (not e!221159))))

(declare-datatypes ((array!20264 0))(
  ( (array!20265 (arr!9621 (Array (_ BitVec 32) (_ BitVec 64))) (size!9973 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20264)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20264 (_ BitVec 32)) Bool)

(assert (=> b!361196 (= res!200951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361197 () Bool)

(declare-fun res!200952 () Bool)

(assert (=> b!361197 (=> (not res!200952) (not e!221159))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-datatypes ((V!12131 0))(
  ( (V!12132 (val!4227 Int)) )
))
(declare-datatypes ((ValueCell!3839 0))(
  ( (ValueCellFull!3839 (v!6422 V!12131)) (EmptyCell!3839) )
))
(declare-datatypes ((array!20266 0))(
  ( (array!20267 (arr!9622 (Array (_ BitVec 32) ValueCell!3839)) (size!9974 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20266)

(assert (=> b!361197 (= res!200952 (and (= (size!9974 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9973 _keys!1541) (size!9974 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361198 () Bool)

(declare-fun e!221162 () Bool)

(declare-fun e!221163 () Bool)

(declare-fun mapRes!14067 () Bool)

(assert (=> b!361198 (= e!221162 (and e!221163 mapRes!14067))))

(declare-fun condMapEmpty!14067 () Bool)

(declare-fun mapDefault!14067 () ValueCell!3839)

(assert (=> b!361198 (= condMapEmpty!14067 (= (arr!9622 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3839)) mapDefault!14067)))))

(declare-fun res!200950 () Bool)

(assert (=> start!35936 (=> (not res!200950) (not e!221159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35936 (= res!200950 (validMask!0 mask!1943))))

(assert (=> start!35936 e!221159))

(assert (=> start!35936 true))

(declare-fun array_inv!7108 (array!20266) Bool)

(assert (=> start!35936 (and (array_inv!7108 _values!1277) e!221162)))

(declare-fun array_inv!7109 (array!20264) Bool)

(assert (=> start!35936 (array_inv!7109 _keys!1541)))

(declare-fun mapIsEmpty!14067 () Bool)

(assert (=> mapIsEmpty!14067 mapRes!14067))

(declare-fun mapNonEmpty!14067 () Bool)

(declare-fun tp!28143 () Bool)

(assert (=> mapNonEmpty!14067 (= mapRes!14067 (and tp!28143 e!221161))))

(declare-fun mapRest!14067 () (Array (_ BitVec 32) ValueCell!3839))

(declare-fun mapKey!14067 () (_ BitVec 32))

(declare-fun mapValue!14067 () ValueCell!3839)

(assert (=> mapNonEmpty!14067 (= (arr!9622 _values!1277) (store mapRest!14067 mapKey!14067 mapValue!14067))))

(declare-fun b!361199 () Bool)

(declare-fun res!200949 () Bool)

(assert (=> b!361199 (=> (not res!200949) (not e!221159))))

(assert (=> b!361199 (= res!200949 (and (bvsle #b00000000000000000000000000000000 (size!9973 _keys!1541)) (bvslt (size!9973 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!361200 () Bool)

(assert (=> b!361200 (= e!221163 tp_is_empty!8365)))

(assert (= (and start!35936 res!200950) b!361197))

(assert (= (and b!361197 res!200952) b!361196))

(assert (= (and b!361196 res!200951) b!361199))

(assert (= (and b!361199 res!200949) b!361194))

(assert (= (and b!361198 condMapEmpty!14067) mapIsEmpty!14067))

(assert (= (and b!361198 (not condMapEmpty!14067)) mapNonEmpty!14067))

(get-info :version)

(assert (= (and mapNonEmpty!14067 ((_ is ValueCellFull!3839) mapValue!14067)) b!361195))

(assert (= (and b!361198 ((_ is ValueCellFull!3839) mapDefault!14067)) b!361200))

(assert (= start!35936 b!361198))

(declare-fun m!358367 () Bool)

(assert (=> b!361194 m!358367))

(declare-fun m!358369 () Bool)

(assert (=> b!361196 m!358369))

(declare-fun m!358371 () Bool)

(assert (=> start!35936 m!358371))

(declare-fun m!358373 () Bool)

(assert (=> start!35936 m!358373))

(declare-fun m!358375 () Bool)

(assert (=> start!35936 m!358375))

(declare-fun m!358377 () Bool)

(assert (=> mapNonEmpty!14067 m!358377))

(check-sat (not start!35936) (not b!361194) (not mapNonEmpty!14067) tp_is_empty!8365 (not b!361196))
(check-sat)
(get-model)

(declare-fun d!71937 () Bool)

(assert (=> d!71937 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35936 d!71937))

(declare-fun d!71939 () Bool)

(assert (=> d!71939 (= (array_inv!7108 _values!1277) (bvsge (size!9974 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35936 d!71939))

(declare-fun d!71941 () Bool)

(assert (=> d!71941 (= (array_inv!7109 _keys!1541) (bvsge (size!9973 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35936 d!71941))

(declare-fun d!71943 () Bool)

(declare-fun res!200981 () Bool)

(declare-fun e!221198 () Bool)

(assert (=> d!71943 (=> res!200981 e!221198)))

(assert (=> d!71943 (= res!200981 ((_ is Nil!5410) Nil!5410))))

(assert (=> d!71943 (= (noDuplicate!184 Nil!5410) e!221198)))

(declare-fun b!361247 () Bool)

(declare-fun e!221199 () Bool)

(assert (=> b!361247 (= e!221198 e!221199)))

(declare-fun res!200982 () Bool)

(assert (=> b!361247 (=> (not res!200982) (not e!221199))))

(declare-fun contains!2404 (List!5413 (_ BitVec 64)) Bool)

(assert (=> b!361247 (= res!200982 (not (contains!2404 (t!10555 Nil!5410) (h!6265 Nil!5410))))))

(declare-fun b!361248 () Bool)

(assert (=> b!361248 (= e!221199 (noDuplicate!184 (t!10555 Nil!5410)))))

(assert (= (and d!71943 (not res!200981)) b!361247))

(assert (= (and b!361247 res!200982) b!361248))

(declare-fun m!358403 () Bool)

(assert (=> b!361247 m!358403))

(declare-fun m!358405 () Bool)

(assert (=> b!361248 m!358405))

(assert (=> b!361194 d!71943))

(declare-fun b!361257 () Bool)

(declare-fun e!221207 () Bool)

(declare-fun e!221208 () Bool)

(assert (=> b!361257 (= e!221207 e!221208)))

(declare-fun lt!166562 () (_ BitVec 64))

(assert (=> b!361257 (= lt!166562 (select (arr!9621 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11101 0))(
  ( (Unit!11102) )
))
(declare-fun lt!166560 () Unit!11101)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20264 (_ BitVec 64) (_ BitVec 32)) Unit!11101)

(assert (=> b!361257 (= lt!166560 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166562 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20264 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361257 (arrayContainsKey!0 _keys!1541 lt!166562 #b00000000000000000000000000000000)))

(declare-fun lt!166561 () Unit!11101)

(assert (=> b!361257 (= lt!166561 lt!166560)))

(declare-fun res!200988 () Bool)

(declare-datatypes ((SeekEntryResult!3443 0))(
  ( (MissingZero!3443 (index!15951 (_ BitVec 32))) (Found!3443 (index!15952 (_ BitVec 32))) (Intermediate!3443 (undefined!4255 Bool) (index!15953 (_ BitVec 32)) (x!35946 (_ BitVec 32))) (Undefined!3443) (MissingVacant!3443 (index!15954 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20264 (_ BitVec 32)) SeekEntryResult!3443)

(assert (=> b!361257 (= res!200988 (= (seekEntryOrOpen!0 (select (arr!9621 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3443 #b00000000000000000000000000000000)))))

(assert (=> b!361257 (=> (not res!200988) (not e!221208))))

(declare-fun b!361258 () Bool)

(declare-fun call!27161 () Bool)

(assert (=> b!361258 (= e!221207 call!27161)))

(declare-fun d!71945 () Bool)

(declare-fun res!200987 () Bool)

(declare-fun e!221206 () Bool)

(assert (=> d!71945 (=> res!200987 e!221206)))

(assert (=> d!71945 (= res!200987 (bvsge #b00000000000000000000000000000000 (size!9973 _keys!1541)))))

(assert (=> d!71945 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221206)))

(declare-fun b!361259 () Bool)

(assert (=> b!361259 (= e!221208 call!27161)))

(declare-fun bm!27158 () Bool)

(assert (=> bm!27158 (= call!27161 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!361260 () Bool)

(assert (=> b!361260 (= e!221206 e!221207)))

(declare-fun c!53699 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361260 (= c!53699 (validKeyInArray!0 (select (arr!9621 _keys!1541) #b00000000000000000000000000000000)))))

(assert (= (and d!71945 (not res!200987)) b!361260))

(assert (= (and b!361260 c!53699) b!361257))

(assert (= (and b!361260 (not c!53699)) b!361258))

(assert (= (and b!361257 res!200988) b!361259))

(assert (= (or b!361259 b!361258) bm!27158))

(declare-fun m!358407 () Bool)

(assert (=> b!361257 m!358407))

(declare-fun m!358409 () Bool)

(assert (=> b!361257 m!358409))

(declare-fun m!358411 () Bool)

(assert (=> b!361257 m!358411))

(assert (=> b!361257 m!358407))

(declare-fun m!358413 () Bool)

(assert (=> b!361257 m!358413))

(declare-fun m!358415 () Bool)

(assert (=> bm!27158 m!358415))

(assert (=> b!361260 m!358407))

(assert (=> b!361260 m!358407))

(declare-fun m!358417 () Bool)

(assert (=> b!361260 m!358417))

(assert (=> b!361196 d!71945))

(declare-fun mapIsEmpty!14076 () Bool)

(declare-fun mapRes!14076 () Bool)

(assert (=> mapIsEmpty!14076 mapRes!14076))

(declare-fun b!361267 () Bool)

(declare-fun e!221214 () Bool)

(assert (=> b!361267 (= e!221214 tp_is_empty!8365)))

(declare-fun b!361268 () Bool)

(declare-fun e!221213 () Bool)

(assert (=> b!361268 (= e!221213 tp_is_empty!8365)))

(declare-fun condMapEmpty!14076 () Bool)

(declare-fun mapDefault!14076 () ValueCell!3839)

(assert (=> mapNonEmpty!14067 (= condMapEmpty!14076 (= mapRest!14067 ((as const (Array (_ BitVec 32) ValueCell!3839)) mapDefault!14076)))))

(assert (=> mapNonEmpty!14067 (= tp!28143 (and e!221213 mapRes!14076))))

(declare-fun mapNonEmpty!14076 () Bool)

(declare-fun tp!28152 () Bool)

(assert (=> mapNonEmpty!14076 (= mapRes!14076 (and tp!28152 e!221214))))

(declare-fun mapRest!14076 () (Array (_ BitVec 32) ValueCell!3839))

(declare-fun mapValue!14076 () ValueCell!3839)

(declare-fun mapKey!14076 () (_ BitVec 32))

(assert (=> mapNonEmpty!14076 (= mapRest!14067 (store mapRest!14076 mapKey!14076 mapValue!14076))))

(assert (= (and mapNonEmpty!14067 condMapEmpty!14076) mapIsEmpty!14076))

(assert (= (and mapNonEmpty!14067 (not condMapEmpty!14076)) mapNonEmpty!14076))

(assert (= (and mapNonEmpty!14076 ((_ is ValueCellFull!3839) mapValue!14076)) b!361267))

(assert (= (and mapNonEmpty!14067 ((_ is ValueCellFull!3839) mapDefault!14076)) b!361268))

(declare-fun m!358419 () Bool)

(assert (=> mapNonEmpty!14076 m!358419))

(check-sat (not b!361260) (not b!361248) (not bm!27158) tp_is_empty!8365 (not b!361247) (not b!361257) (not mapNonEmpty!14076))
(check-sat)
