; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35968 () Bool)

(assert start!35968)

(declare-fun b!361367 () Bool)

(declare-fun e!221280 () Bool)

(declare-fun tp_is_empty!8373 () Bool)

(assert (=> b!361367 (= e!221280 tp_is_empty!8373)))

(declare-fun b!361368 () Bool)

(declare-fun e!221283 () Bool)

(declare-fun e!221282 () Bool)

(assert (=> b!361368 (= e!221283 e!221282)))

(declare-fun res!201023 () Bool)

(assert (=> b!361368 (=> res!201023 e!221282)))

(declare-datatypes ((List!5505 0))(
  ( (Nil!5502) (Cons!5501 (h!6357 (_ BitVec 64)) (t!10655 List!5505)) )
))
(declare-fun contains!2425 (List!5505 (_ BitVec 64)) Bool)

(assert (=> b!361368 (= res!201023 (contains!2425 Nil!5502 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!361369 () Bool)

(assert (=> b!361369 (= e!221282 (contains!2425 Nil!5502 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!361371 () Bool)

(declare-fun res!201026 () Bool)

(assert (=> b!361371 (=> (not res!201026) (not e!221283))))

(declare-datatypes ((array!20299 0))(
  ( (array!20300 (arr!9638 (Array (_ BitVec 32) (_ BitVec 64))) (size!9990 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20299)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20299 (_ BitVec 32)) Bool)

(assert (=> b!361371 (= res!201026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun mapIsEmpty!14082 () Bool)

(declare-fun mapRes!14082 () Bool)

(assert (=> mapIsEmpty!14082 mapRes!14082))

(declare-fun mapNonEmpty!14082 () Bool)

(declare-fun tp!28158 () Bool)

(assert (=> mapNonEmpty!14082 (= mapRes!14082 (and tp!28158 e!221280))))

(declare-fun mapKey!14082 () (_ BitVec 32))

(declare-datatypes ((V!12141 0))(
  ( (V!12142 (val!4231 Int)) )
))
(declare-datatypes ((ValueCell!3843 0))(
  ( (ValueCellFull!3843 (v!6425 V!12141)) (EmptyCell!3843) )
))
(declare-fun mapRest!14082 () (Array (_ BitVec 32) ValueCell!3843))

(declare-datatypes ((array!20301 0))(
  ( (array!20302 (arr!9639 (Array (_ BitVec 32) ValueCell!3843)) (size!9991 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20301)

(declare-fun mapValue!14082 () ValueCell!3843)

(assert (=> mapNonEmpty!14082 (= (arr!9639 _values!1277) (store mapRest!14082 mapKey!14082 mapValue!14082))))

(declare-fun b!361372 () Bool)

(declare-fun e!221284 () Bool)

(assert (=> b!361372 (= e!221284 tp_is_empty!8373)))

(declare-fun b!361373 () Bool)

(declare-fun e!221281 () Bool)

(assert (=> b!361373 (= e!221281 (and e!221284 mapRes!14082))))

(declare-fun condMapEmpty!14082 () Bool)

(declare-fun mapDefault!14082 () ValueCell!3843)

(assert (=> b!361373 (= condMapEmpty!14082 (= (arr!9639 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3843)) mapDefault!14082)))))

(declare-fun res!201022 () Bool)

(assert (=> start!35968 (=> (not res!201022) (not e!221283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35968 (= res!201022 (validMask!0 mask!1943))))

(assert (=> start!35968 e!221283))

(assert (=> start!35968 true))

(declare-fun array_inv!7088 (array!20301) Bool)

(assert (=> start!35968 (and (array_inv!7088 _values!1277) e!221281)))

(declare-fun array_inv!7089 (array!20299) Bool)

(assert (=> start!35968 (array_inv!7089 _keys!1541)))

(declare-fun b!361370 () Bool)

(declare-fun res!201024 () Bool)

(assert (=> b!361370 (=> (not res!201024) (not e!221283))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361370 (= res!201024 (and (= (size!9991 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9990 _keys!1541) (size!9991 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361374 () Bool)

(declare-fun res!201027 () Bool)

(assert (=> b!361374 (=> (not res!201027) (not e!221283))))

(assert (=> b!361374 (= res!201027 (and (bvsle #b00000000000000000000000000000000 (size!9990 _keys!1541)) (bvslt (size!9990 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!361375 () Bool)

(declare-fun res!201025 () Bool)

(assert (=> b!361375 (=> (not res!201025) (not e!221283))))

(declare-fun noDuplicate!183 (List!5505) Bool)

(assert (=> b!361375 (= res!201025 (noDuplicate!183 Nil!5502))))

(assert (= (and start!35968 res!201022) b!361370))

(assert (= (and b!361370 res!201024) b!361371))

(assert (= (and b!361371 res!201026) b!361374))

(assert (= (and b!361374 res!201027) b!361375))

(assert (= (and b!361375 res!201025) b!361368))

(assert (= (and b!361368 (not res!201023)) b!361369))

(assert (= (and b!361373 condMapEmpty!14082) mapIsEmpty!14082))

(assert (= (and b!361373 (not condMapEmpty!14082)) mapNonEmpty!14082))

(get-info :version)

(assert (= (and mapNonEmpty!14082 ((_ is ValueCellFull!3843) mapValue!14082)) b!361367))

(assert (= (and b!361373 ((_ is ValueCellFull!3843) mapDefault!14082)) b!361372))

(assert (= start!35968 b!361373))

(declare-fun m!358213 () Bool)

(assert (=> b!361375 m!358213))

(declare-fun m!358215 () Bool)

(assert (=> b!361369 m!358215))

(declare-fun m!358217 () Bool)

(assert (=> b!361371 m!358217))

(declare-fun m!358219 () Bool)

(assert (=> start!35968 m!358219))

(declare-fun m!358221 () Bool)

(assert (=> start!35968 m!358221))

(declare-fun m!358223 () Bool)

(assert (=> start!35968 m!358223))

(declare-fun m!358225 () Bool)

(assert (=> b!361368 m!358225))

(declare-fun m!358227 () Bool)

(assert (=> mapNonEmpty!14082 m!358227))

(check-sat (not b!361369) (not b!361375) (not b!361371) (not b!361368) (not mapNonEmpty!14082) tp_is_empty!8373 (not start!35968))
(check-sat)
(get-model)

(declare-fun d!71921 () Bool)

(declare-fun lt!166547 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!198 (List!5505) (InoxSet (_ BitVec 64)))

(assert (=> d!71921 (= lt!166547 (select (content!198 Nil!5502) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!221308 () Bool)

(assert (=> d!71921 (= lt!166547 e!221308)))

(declare-fun res!201051 () Bool)

(assert (=> d!71921 (=> (not res!201051) (not e!221308))))

(assert (=> d!71921 (= res!201051 ((_ is Cons!5501) Nil!5502))))

(assert (=> d!71921 (= (contains!2425 Nil!5502 #b0000000000000000000000000000000000000000000000000000000000000000) lt!166547)))

(declare-fun b!361407 () Bool)

(declare-fun e!221307 () Bool)

(assert (=> b!361407 (= e!221308 e!221307)))

(declare-fun res!201050 () Bool)

(assert (=> b!361407 (=> res!201050 e!221307)))

(assert (=> b!361407 (= res!201050 (= (h!6357 Nil!5502) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!361408 () Bool)

(assert (=> b!361408 (= e!221307 (contains!2425 (t!10655 Nil!5502) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!71921 res!201051) b!361407))

(assert (= (and b!361407 (not res!201050)) b!361408))

(declare-fun m!358245 () Bool)

(assert (=> d!71921 m!358245))

(declare-fun m!358247 () Bool)

(assert (=> d!71921 m!358247))

(declare-fun m!358249 () Bool)

(assert (=> b!361408 m!358249))

(assert (=> b!361368 d!71921))

(declare-fun b!361417 () Bool)

(declare-fun e!221316 () Bool)

(declare-fun e!221315 () Bool)

(assert (=> b!361417 (= e!221316 e!221315)))

(declare-fun c!53727 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361417 (= c!53727 (validKeyInArray!0 (select (arr!9638 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361418 () Bool)

(declare-fun e!221317 () Bool)

(declare-fun call!27178 () Bool)

(assert (=> b!361418 (= e!221317 call!27178)))

(declare-fun b!361419 () Bool)

(assert (=> b!361419 (= e!221315 e!221317)))

(declare-fun lt!166554 () (_ BitVec 64))

(assert (=> b!361419 (= lt!166554 (select (arr!9638 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11114 0))(
  ( (Unit!11115) )
))
(declare-fun lt!166555 () Unit!11114)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20299 (_ BitVec 64) (_ BitVec 32)) Unit!11114)

(assert (=> b!361419 (= lt!166555 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166554 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361419 (arrayContainsKey!0 _keys!1541 lt!166554 #b00000000000000000000000000000000)))

(declare-fun lt!166556 () Unit!11114)

(assert (=> b!361419 (= lt!166556 lt!166555)))

(declare-fun res!201056 () Bool)

(declare-datatypes ((SeekEntryResult!3495 0))(
  ( (MissingZero!3495 (index!16159 (_ BitVec 32))) (Found!3495 (index!16160 (_ BitVec 32))) (Intermediate!3495 (undefined!4307 Bool) (index!16161 (_ BitVec 32)) (x!36011 (_ BitVec 32))) (Undefined!3495) (MissingVacant!3495 (index!16162 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20299 (_ BitVec 32)) SeekEntryResult!3495)

(assert (=> b!361419 (= res!201056 (= (seekEntryOrOpen!0 (select (arr!9638 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3495 #b00000000000000000000000000000000)))))

(assert (=> b!361419 (=> (not res!201056) (not e!221317))))

(declare-fun d!71923 () Bool)

(declare-fun res!201057 () Bool)

(assert (=> d!71923 (=> res!201057 e!221316)))

(assert (=> d!71923 (= res!201057 (bvsge #b00000000000000000000000000000000 (size!9990 _keys!1541)))))

(assert (=> d!71923 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221316)))

(declare-fun bm!27175 () Bool)

(assert (=> bm!27175 (= call!27178 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!361420 () Bool)

(assert (=> b!361420 (= e!221315 call!27178)))

(assert (= (and d!71923 (not res!201057)) b!361417))

(assert (= (and b!361417 c!53727) b!361419))

(assert (= (and b!361417 (not c!53727)) b!361420))

(assert (= (and b!361419 res!201056) b!361418))

(assert (= (or b!361418 b!361420) bm!27175))

(declare-fun m!358251 () Bool)

(assert (=> b!361417 m!358251))

(assert (=> b!361417 m!358251))

(declare-fun m!358253 () Bool)

(assert (=> b!361417 m!358253))

(assert (=> b!361419 m!358251))

(declare-fun m!358255 () Bool)

(assert (=> b!361419 m!358255))

(declare-fun m!358257 () Bool)

(assert (=> b!361419 m!358257))

(assert (=> b!361419 m!358251))

(declare-fun m!358259 () Bool)

(assert (=> b!361419 m!358259))

(declare-fun m!358261 () Bool)

(assert (=> bm!27175 m!358261))

(assert (=> b!361371 d!71923))

(declare-fun d!71925 () Bool)

(declare-fun res!201062 () Bool)

(declare-fun e!221322 () Bool)

(assert (=> d!71925 (=> res!201062 e!221322)))

(assert (=> d!71925 (= res!201062 ((_ is Nil!5502) Nil!5502))))

(assert (=> d!71925 (= (noDuplicate!183 Nil!5502) e!221322)))

(declare-fun b!361425 () Bool)

(declare-fun e!221323 () Bool)

(assert (=> b!361425 (= e!221322 e!221323)))

(declare-fun res!201063 () Bool)

(assert (=> b!361425 (=> (not res!201063) (not e!221323))))

(assert (=> b!361425 (= res!201063 (not (contains!2425 (t!10655 Nil!5502) (h!6357 Nil!5502))))))

(declare-fun b!361426 () Bool)

(assert (=> b!361426 (= e!221323 (noDuplicate!183 (t!10655 Nil!5502)))))

(assert (= (and d!71925 (not res!201062)) b!361425))

(assert (= (and b!361425 res!201063) b!361426))

(declare-fun m!358263 () Bool)

(assert (=> b!361425 m!358263))

(declare-fun m!358265 () Bool)

(assert (=> b!361426 m!358265))

(assert (=> b!361375 d!71925))

(declare-fun d!71927 () Bool)

(assert (=> d!71927 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35968 d!71927))

(declare-fun d!71929 () Bool)

(assert (=> d!71929 (= (array_inv!7088 _values!1277) (bvsge (size!9991 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35968 d!71929))

(declare-fun d!71931 () Bool)

(assert (=> d!71931 (= (array_inv!7089 _keys!1541) (bvsge (size!9990 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35968 d!71931))

(declare-fun d!71933 () Bool)

(declare-fun lt!166557 () Bool)

(assert (=> d!71933 (= lt!166557 (select (content!198 Nil!5502) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!221325 () Bool)

(assert (=> d!71933 (= lt!166557 e!221325)))

(declare-fun res!201065 () Bool)

(assert (=> d!71933 (=> (not res!201065) (not e!221325))))

(assert (=> d!71933 (= res!201065 ((_ is Cons!5501) Nil!5502))))

(assert (=> d!71933 (= (contains!2425 Nil!5502 #b1000000000000000000000000000000000000000000000000000000000000000) lt!166557)))

(declare-fun b!361427 () Bool)

(declare-fun e!221324 () Bool)

(assert (=> b!361427 (= e!221325 e!221324)))

(declare-fun res!201064 () Bool)

(assert (=> b!361427 (=> res!201064 e!221324)))

(assert (=> b!361427 (= res!201064 (= (h!6357 Nil!5502) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!361428 () Bool)

(assert (=> b!361428 (= e!221324 (contains!2425 (t!10655 Nil!5502) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!71933 res!201065) b!361427))

(assert (= (and b!361427 (not res!201064)) b!361428))

(assert (=> d!71933 m!358245))

(declare-fun m!358267 () Bool)

(assert (=> d!71933 m!358267))

(declare-fun m!358269 () Bool)

(assert (=> b!361428 m!358269))

(assert (=> b!361369 d!71933))

(declare-fun b!361436 () Bool)

(declare-fun e!221330 () Bool)

(assert (=> b!361436 (= e!221330 tp_is_empty!8373)))

(declare-fun mapNonEmpty!14088 () Bool)

(declare-fun mapRes!14088 () Bool)

(declare-fun tp!28164 () Bool)

(declare-fun e!221331 () Bool)

(assert (=> mapNonEmpty!14088 (= mapRes!14088 (and tp!28164 e!221331))))

(declare-fun mapValue!14088 () ValueCell!3843)

(declare-fun mapRest!14088 () (Array (_ BitVec 32) ValueCell!3843))

(declare-fun mapKey!14088 () (_ BitVec 32))

(assert (=> mapNonEmpty!14088 (= mapRest!14082 (store mapRest!14088 mapKey!14088 mapValue!14088))))

(declare-fun mapIsEmpty!14088 () Bool)

(assert (=> mapIsEmpty!14088 mapRes!14088))

(declare-fun condMapEmpty!14088 () Bool)

(declare-fun mapDefault!14088 () ValueCell!3843)

(assert (=> mapNonEmpty!14082 (= condMapEmpty!14088 (= mapRest!14082 ((as const (Array (_ BitVec 32) ValueCell!3843)) mapDefault!14088)))))

(assert (=> mapNonEmpty!14082 (= tp!28158 (and e!221330 mapRes!14088))))

(declare-fun b!361435 () Bool)

(assert (=> b!361435 (= e!221331 tp_is_empty!8373)))

(assert (= (and mapNonEmpty!14082 condMapEmpty!14088) mapIsEmpty!14088))

(assert (= (and mapNonEmpty!14082 (not condMapEmpty!14088)) mapNonEmpty!14088))

(assert (= (and mapNonEmpty!14088 ((_ is ValueCellFull!3843) mapValue!14088)) b!361435))

(assert (= (and mapNonEmpty!14082 ((_ is ValueCellFull!3843) mapDefault!14088)) b!361436))

(declare-fun m!358271 () Bool)

(assert (=> mapNonEmpty!14088 m!358271))

(check-sat (not b!361425) (not b!361426) (not bm!27175) (not d!71921) (not mapNonEmpty!14088) (not d!71933) (not b!361428) (not b!361419) tp_is_empty!8373 (not b!361408) (not b!361417))
(check-sat)
