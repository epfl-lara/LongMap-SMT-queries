; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106954 () Bool)

(assert start!106954)

(declare-fun mapIsEmpty!50560 () Bool)

(declare-fun mapRes!50560 () Bool)

(assert (=> mapIsEmpty!50560 mapRes!50560))

(declare-fun b!1268347 () Bool)

(declare-fun e!722714 () Bool)

(declare-fun tp_is_empty!32655 () Bool)

(assert (=> b!1268347 (= e!722714 tp_is_empty!32655)))

(declare-fun mapNonEmpty!50560 () Bool)

(declare-fun tp!96739 () Bool)

(assert (=> mapNonEmpty!50560 (= mapRes!50560 (and tp!96739 e!722714))))

(declare-datatypes ((V!48733 0))(
  ( (V!48734 (val!16402 Int)) )
))
(declare-datatypes ((ValueCell!15474 0))(
  ( (ValueCellFull!15474 (v!19038 V!48733)) (EmptyCell!15474) )
))
(declare-datatypes ((array!82582 0))(
  ( (array!82583 (arr!39829 (Array (_ BitVec 32) ValueCell!15474)) (size!40365 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82582)

(declare-fun mapRest!50560 () (Array (_ BitVec 32) ValueCell!15474))

(declare-fun mapKey!50560 () (_ BitVec 32))

(declare-fun mapValue!50560 () ValueCell!15474)

(assert (=> mapNonEmpty!50560 (= (arr!39829 _values!1134) (store mapRest!50560 mapKey!50560 mapValue!50560))))

(declare-fun b!1268348 () Bool)

(declare-fun res!844199 () Bool)

(declare-fun e!722716 () Bool)

(assert (=> b!1268348 (=> (not res!844199) (not e!722716))))

(declare-datatypes ((array!82584 0))(
  ( (array!82585 (arr!39830 (Array (_ BitVec 32) (_ BitVec 64))) (size!40366 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82584)

(assert (=> b!1268348 (= res!844199 (and (bvsle #b00000000000000000000000000000000 (size!40366 _keys!1364)) (bvslt (size!40366 _keys!1364) #b01111111111111111111111111111111)))))

(declare-fun b!1268349 () Bool)

(declare-fun res!844197 () Bool)

(assert (=> b!1268349 (=> (not res!844197) (not e!722716))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82584 (_ BitVec 32)) Bool)

(assert (=> b!1268349 (= res!844197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268350 () Bool)

(declare-fun e!722713 () Bool)

(declare-fun e!722715 () Bool)

(assert (=> b!1268350 (= e!722713 (and e!722715 mapRes!50560))))

(declare-fun condMapEmpty!50560 () Bool)

(declare-fun mapDefault!50560 () ValueCell!15474)

(assert (=> b!1268350 (= condMapEmpty!50560 (= (arr!39829 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15474)) mapDefault!50560)))))

(declare-fun b!1268351 () Bool)

(declare-fun res!844196 () Bool)

(assert (=> b!1268351 (=> (not res!844196) (not e!722716))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268351 (= res!844196 (and (= (size!40365 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40366 _keys!1364) (size!40365 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268352 () Bool)

(declare-fun e!722712 () Bool)

(assert (=> b!1268352 (= e!722716 e!722712)))

(declare-fun res!844195 () Bool)

(assert (=> b!1268352 (=> res!844195 e!722712)))

(declare-datatypes ((List!28381 0))(
  ( (Nil!28378) (Cons!28377 (h!29586 (_ BitVec 64)) (t!41910 List!28381)) )
))
(declare-fun contains!7663 (List!28381 (_ BitVec 64)) Bool)

(assert (=> b!1268352 (= res!844195 (contains!7663 Nil!28378 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1268354 () Bool)

(assert (=> b!1268354 (= e!722715 tp_is_empty!32655)))

(declare-fun b!1268355 () Bool)

(declare-fun res!844198 () Bool)

(assert (=> b!1268355 (=> (not res!844198) (not e!722716))))

(declare-fun noDuplicate!2045 (List!28381) Bool)

(assert (=> b!1268355 (= res!844198 (noDuplicate!2045 Nil!28378))))

(declare-fun res!844200 () Bool)

(assert (=> start!106954 (=> (not res!844200) (not e!722716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106954 (= res!844200 (validMask!0 mask!1730))))

(assert (=> start!106954 e!722716))

(declare-fun array_inv!30309 (array!82582) Bool)

(assert (=> start!106954 (and (array_inv!30309 _values!1134) e!722713)))

(assert (=> start!106954 true))

(declare-fun array_inv!30310 (array!82584) Bool)

(assert (=> start!106954 (array_inv!30310 _keys!1364)))

(declare-fun b!1268353 () Bool)

(assert (=> b!1268353 (= e!722712 (contains!7663 Nil!28378 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!106954 res!844200) b!1268351))

(assert (= (and b!1268351 res!844196) b!1268349))

(assert (= (and b!1268349 res!844197) b!1268348))

(assert (= (and b!1268348 res!844199) b!1268355))

(assert (= (and b!1268355 res!844198) b!1268352))

(assert (= (and b!1268352 (not res!844195)) b!1268353))

(assert (= (and b!1268350 condMapEmpty!50560) mapIsEmpty!50560))

(assert (= (and b!1268350 (not condMapEmpty!50560)) mapNonEmpty!50560))

(get-info :version)

(assert (= (and mapNonEmpty!50560 ((_ is ValueCellFull!15474) mapValue!50560)) b!1268347))

(assert (= (and b!1268350 ((_ is ValueCellFull!15474) mapDefault!50560)) b!1268354))

(assert (= start!106954 b!1268350))

(declare-fun m!1167215 () Bool)

(assert (=> start!106954 m!1167215))

(declare-fun m!1167217 () Bool)

(assert (=> start!106954 m!1167217))

(declare-fun m!1167219 () Bool)

(assert (=> start!106954 m!1167219))

(declare-fun m!1167221 () Bool)

(assert (=> b!1268349 m!1167221))

(declare-fun m!1167223 () Bool)

(assert (=> b!1268355 m!1167223))

(declare-fun m!1167225 () Bool)

(assert (=> b!1268353 m!1167225))

(declare-fun m!1167227 () Bool)

(assert (=> b!1268352 m!1167227))

(declare-fun m!1167229 () Bool)

(assert (=> mapNonEmpty!50560 m!1167229))

(check-sat tp_is_empty!32655 (not start!106954) (not b!1268353) (not b!1268352) (not mapNonEmpty!50560) (not b!1268349) (not b!1268355))
(check-sat)
(get-model)

(declare-fun d!139671 () Bool)

(assert (=> d!139671 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!106954 d!139671))

(declare-fun d!139673 () Bool)

(assert (=> d!139673 (= (array_inv!30309 _values!1134) (bvsge (size!40365 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!106954 d!139673))

(declare-fun d!139675 () Bool)

(assert (=> d!139675 (= (array_inv!30310 _keys!1364) (bvsge (size!40366 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!106954 d!139675))

(declare-fun d!139677 () Bool)

(declare-fun lt!574412 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!639 (List!28381) (InoxSet (_ BitVec 64)))

(assert (=> d!139677 (= lt!574412 (select (content!639 Nil!28378) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!722740 () Bool)

(assert (=> d!139677 (= lt!574412 e!722740)))

(declare-fun res!844224 () Bool)

(assert (=> d!139677 (=> (not res!844224) (not e!722740))))

(assert (=> d!139677 (= res!844224 ((_ is Cons!28377) Nil!28378))))

(assert (=> d!139677 (= (contains!7663 Nil!28378 #b1000000000000000000000000000000000000000000000000000000000000000) lt!574412)))

(declare-fun b!1268387 () Bool)

(declare-fun e!722739 () Bool)

(assert (=> b!1268387 (= e!722740 e!722739)))

(declare-fun res!844223 () Bool)

(assert (=> b!1268387 (=> res!844223 e!722739)))

(assert (=> b!1268387 (= res!844223 (= (h!29586 Nil!28378) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1268388 () Bool)

(assert (=> b!1268388 (= e!722739 (contains!7663 (t!41910 Nil!28378) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!139677 res!844224) b!1268387))

(assert (= (and b!1268387 (not res!844223)) b!1268388))

(declare-fun m!1167247 () Bool)

(assert (=> d!139677 m!1167247))

(declare-fun m!1167249 () Bool)

(assert (=> d!139677 m!1167249))

(declare-fun m!1167251 () Bool)

(assert (=> b!1268388 m!1167251))

(assert (=> b!1268353 d!139677))

(declare-fun d!139679 () Bool)

(declare-fun res!844229 () Bool)

(declare-fun e!722745 () Bool)

(assert (=> d!139679 (=> res!844229 e!722745)))

(assert (=> d!139679 (= res!844229 ((_ is Nil!28378) Nil!28378))))

(assert (=> d!139679 (= (noDuplicate!2045 Nil!28378) e!722745)))

(declare-fun b!1268393 () Bool)

(declare-fun e!722746 () Bool)

(assert (=> b!1268393 (= e!722745 e!722746)))

(declare-fun res!844230 () Bool)

(assert (=> b!1268393 (=> (not res!844230) (not e!722746))))

(assert (=> b!1268393 (= res!844230 (not (contains!7663 (t!41910 Nil!28378) (h!29586 Nil!28378))))))

(declare-fun b!1268394 () Bool)

(assert (=> b!1268394 (= e!722746 (noDuplicate!2045 (t!41910 Nil!28378)))))

(assert (= (and d!139679 (not res!844229)) b!1268393))

(assert (= (and b!1268393 res!844230) b!1268394))

(declare-fun m!1167253 () Bool)

(assert (=> b!1268393 m!1167253))

(declare-fun m!1167255 () Bool)

(assert (=> b!1268394 m!1167255))

(assert (=> b!1268355 d!139679))

(declare-fun d!139681 () Bool)

(declare-fun res!844235 () Bool)

(declare-fun e!722754 () Bool)

(assert (=> d!139681 (=> res!844235 e!722754)))

(assert (=> d!139681 (= res!844235 (bvsge #b00000000000000000000000000000000 (size!40366 _keys!1364)))))

(assert (=> d!139681 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!722754)))

(declare-fun b!1268403 () Bool)

(declare-fun e!722753 () Bool)

(declare-fun e!722755 () Bool)

(assert (=> b!1268403 (= e!722753 e!722755)))

(declare-fun lt!574420 () (_ BitVec 64))

(assert (=> b!1268403 (= lt!574420 (select (arr!39830 _keys!1364) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42234 0))(
  ( (Unit!42235) )
))
(declare-fun lt!574421 () Unit!42234)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82584 (_ BitVec 64) (_ BitVec 32)) Unit!42234)

(assert (=> b!1268403 (= lt!574421 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!574420 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1268403 (arrayContainsKey!0 _keys!1364 lt!574420 #b00000000000000000000000000000000)))

(declare-fun lt!574419 () Unit!42234)

(assert (=> b!1268403 (= lt!574419 lt!574421)))

(declare-fun res!844236 () Bool)

(declare-datatypes ((SeekEntryResult!9986 0))(
  ( (MissingZero!9986 (index!42315 (_ BitVec 32))) (Found!9986 (index!42316 (_ BitVec 32))) (Intermediate!9986 (undefined!10798 Bool) (index!42317 (_ BitVec 32)) (x!111867 (_ BitVec 32))) (Undefined!9986) (MissingVacant!9986 (index!42318 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82584 (_ BitVec 32)) SeekEntryResult!9986)

(assert (=> b!1268403 (= res!844236 (= (seekEntryOrOpen!0 (select (arr!39830 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9986 #b00000000000000000000000000000000)))))

(assert (=> b!1268403 (=> (not res!844236) (not e!722755))))

(declare-fun b!1268404 () Bool)

(assert (=> b!1268404 (= e!722754 e!722753)))

(declare-fun c!123632 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1268404 (= c!123632 (validKeyInArray!0 (select (arr!39830 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1268405 () Bool)

(declare-fun call!62515 () Bool)

(assert (=> b!1268405 (= e!722753 call!62515)))

(declare-fun b!1268406 () Bool)

(assert (=> b!1268406 (= e!722755 call!62515)))

(declare-fun bm!62512 () Bool)

(assert (=> bm!62512 (= call!62515 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(assert (= (and d!139681 (not res!844235)) b!1268404))

(assert (= (and b!1268404 c!123632) b!1268403))

(assert (= (and b!1268404 (not c!123632)) b!1268405))

(assert (= (and b!1268403 res!844236) b!1268406))

(assert (= (or b!1268406 b!1268405) bm!62512))

(declare-fun m!1167257 () Bool)

(assert (=> b!1268403 m!1167257))

(declare-fun m!1167259 () Bool)

(assert (=> b!1268403 m!1167259))

(declare-fun m!1167261 () Bool)

(assert (=> b!1268403 m!1167261))

(assert (=> b!1268403 m!1167257))

(declare-fun m!1167263 () Bool)

(assert (=> b!1268403 m!1167263))

(assert (=> b!1268404 m!1167257))

(assert (=> b!1268404 m!1167257))

(declare-fun m!1167265 () Bool)

(assert (=> b!1268404 m!1167265))

(declare-fun m!1167267 () Bool)

(assert (=> bm!62512 m!1167267))

(assert (=> b!1268349 d!139681))

(declare-fun d!139683 () Bool)

(declare-fun lt!574422 () Bool)

(assert (=> d!139683 (= lt!574422 (select (content!639 Nil!28378) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!722757 () Bool)

(assert (=> d!139683 (= lt!574422 e!722757)))

(declare-fun res!844238 () Bool)

(assert (=> d!139683 (=> (not res!844238) (not e!722757))))

(assert (=> d!139683 (= res!844238 ((_ is Cons!28377) Nil!28378))))

(assert (=> d!139683 (= (contains!7663 Nil!28378 #b0000000000000000000000000000000000000000000000000000000000000000) lt!574422)))

(declare-fun b!1268407 () Bool)

(declare-fun e!722756 () Bool)

(assert (=> b!1268407 (= e!722757 e!722756)))

(declare-fun res!844237 () Bool)

(assert (=> b!1268407 (=> res!844237 e!722756)))

(assert (=> b!1268407 (= res!844237 (= (h!29586 Nil!28378) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1268408 () Bool)

(assert (=> b!1268408 (= e!722756 (contains!7663 (t!41910 Nil!28378) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!139683 res!844238) b!1268407))

(assert (= (and b!1268407 (not res!844237)) b!1268408))

(assert (=> d!139683 m!1167247))

(declare-fun m!1167269 () Bool)

(assert (=> d!139683 m!1167269))

(declare-fun m!1167271 () Bool)

(assert (=> b!1268408 m!1167271))

(assert (=> b!1268352 d!139683))

(declare-fun condMapEmpty!50566 () Bool)

(declare-fun mapDefault!50566 () ValueCell!15474)

(assert (=> mapNonEmpty!50560 (= condMapEmpty!50566 (= mapRest!50560 ((as const (Array (_ BitVec 32) ValueCell!15474)) mapDefault!50566)))))

(declare-fun e!722762 () Bool)

(declare-fun mapRes!50566 () Bool)

(assert (=> mapNonEmpty!50560 (= tp!96739 (and e!722762 mapRes!50566))))

(declare-fun b!1268416 () Bool)

(assert (=> b!1268416 (= e!722762 tp_is_empty!32655)))

(declare-fun mapIsEmpty!50566 () Bool)

(assert (=> mapIsEmpty!50566 mapRes!50566))

(declare-fun mapNonEmpty!50566 () Bool)

(declare-fun tp!96745 () Bool)

(declare-fun e!722763 () Bool)

(assert (=> mapNonEmpty!50566 (= mapRes!50566 (and tp!96745 e!722763))))

(declare-fun mapKey!50566 () (_ BitVec 32))

(declare-fun mapValue!50566 () ValueCell!15474)

(declare-fun mapRest!50566 () (Array (_ BitVec 32) ValueCell!15474))

(assert (=> mapNonEmpty!50566 (= mapRest!50560 (store mapRest!50566 mapKey!50566 mapValue!50566))))

(declare-fun b!1268415 () Bool)

(assert (=> b!1268415 (= e!722763 tp_is_empty!32655)))

(assert (= (and mapNonEmpty!50560 condMapEmpty!50566) mapIsEmpty!50566))

(assert (= (and mapNonEmpty!50560 (not condMapEmpty!50566)) mapNonEmpty!50566))

(assert (= (and mapNonEmpty!50566 ((_ is ValueCellFull!15474) mapValue!50566)) b!1268415))

(assert (= (and mapNonEmpty!50560 ((_ is ValueCellFull!15474) mapDefault!50566)) b!1268416))

(declare-fun m!1167273 () Bool)

(assert (=> mapNonEmpty!50566 m!1167273))

(check-sat tp_is_empty!32655 (not b!1268404) (not b!1268393) (not b!1268408) (not b!1268388) (not bm!62512) (not d!139683) (not b!1268394) (not mapNonEmpty!50566) (not d!139677) (not b!1268403))
(check-sat)
