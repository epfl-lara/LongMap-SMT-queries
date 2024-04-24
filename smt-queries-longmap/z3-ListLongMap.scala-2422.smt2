; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38246 () Bool)

(assert start!38246)

(declare-fun b!394715 () Bool)

(declare-fun e!238959 () Bool)

(declare-fun tp_is_empty!9769 () Bool)

(assert (=> b!394715 (= e!238959 tp_is_empty!9769)))

(declare-fun b!394716 () Bool)

(declare-fun e!238956 () Bool)

(assert (=> b!394716 (= e!238956 tp_is_empty!9769)))

(declare-fun b!394717 () Bool)

(declare-fun e!238955 () Bool)

(declare-fun mapRes!16254 () Bool)

(assert (=> b!394717 (= e!238955 (and e!238959 mapRes!16254))))

(declare-fun condMapEmpty!16254 () Bool)

(declare-datatypes ((V!14131 0))(
  ( (V!14132 (val!4929 Int)) )
))
(declare-datatypes ((ValueCell!4541 0))(
  ( (ValueCellFull!4541 (v!7175 V!14131)) (EmptyCell!4541) )
))
(declare-datatypes ((array!23434 0))(
  ( (array!23435 (arr!11173 (Array (_ BitVec 32) ValueCell!4541)) (size!11525 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23434)

(declare-fun mapDefault!16254 () ValueCell!4541)

(assert (=> b!394717 (= condMapEmpty!16254 (= (arr!11173 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4541)) mapDefault!16254)))))

(declare-fun b!394718 () Bool)

(declare-fun e!238958 () Bool)

(declare-datatypes ((array!23436 0))(
  ( (array!23437 (arr!11174 (Array (_ BitVec 32) (_ BitVec 64))) (size!11526 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23436)

(assert (=> b!394718 (= e!238958 (and (bvsle #b00000000000000000000000000000000 (size!11526 _keys!709)) (bvsge (size!11526 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!394719 () Bool)

(declare-fun res!226279 () Bool)

(assert (=> b!394719 (=> (not res!226279) (not e!238958))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!394719 (= res!226279 (and (= (size!11525 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11526 _keys!709) (size!11525 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16254 () Bool)

(assert (=> mapIsEmpty!16254 mapRes!16254))

(declare-fun b!394720 () Bool)

(declare-fun res!226277 () Bool)

(assert (=> b!394720 (=> (not res!226277) (not e!238958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23436 (_ BitVec 32)) Bool)

(assert (=> b!394720 (= res!226277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16254 () Bool)

(declare-fun tp!32049 () Bool)

(assert (=> mapNonEmpty!16254 (= mapRes!16254 (and tp!32049 e!238956))))

(declare-fun mapValue!16254 () ValueCell!4541)

(declare-fun mapRest!16254 () (Array (_ BitVec 32) ValueCell!4541))

(declare-fun mapKey!16254 () (_ BitVec 32))

(assert (=> mapNonEmpty!16254 (= (arr!11173 _values!549) (store mapRest!16254 mapKey!16254 mapValue!16254))))

(declare-fun b!394714 () Bool)

(declare-fun res!226280 () Bool)

(assert (=> b!394714 (=> (not res!226280) (not e!238958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394714 (= res!226280 (validMask!0 mask!1025))))

(declare-fun res!226278 () Bool)

(assert (=> start!38246 (=> (not res!226278) (not e!238958))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38246 (= res!226278 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11526 _keys!709))))))

(assert (=> start!38246 e!238958))

(assert (=> start!38246 true))

(declare-fun array_inv!8258 (array!23434) Bool)

(assert (=> start!38246 (and (array_inv!8258 _values!549) e!238955)))

(declare-fun array_inv!8259 (array!23436) Bool)

(assert (=> start!38246 (array_inv!8259 _keys!709)))

(assert (= (and start!38246 res!226278) b!394714))

(assert (= (and b!394714 res!226280) b!394719))

(assert (= (and b!394719 res!226279) b!394720))

(assert (= (and b!394720 res!226277) b!394718))

(assert (= (and b!394717 condMapEmpty!16254) mapIsEmpty!16254))

(assert (= (and b!394717 (not condMapEmpty!16254)) mapNonEmpty!16254))

(get-info :version)

(assert (= (and mapNonEmpty!16254 ((_ is ValueCellFull!4541) mapValue!16254)) b!394716))

(assert (= (and b!394717 ((_ is ValueCellFull!4541) mapDefault!16254)) b!394715))

(assert (= start!38246 b!394717))

(declare-fun m!391347 () Bool)

(assert (=> b!394720 m!391347))

(declare-fun m!391349 () Bool)

(assert (=> mapNonEmpty!16254 m!391349))

(declare-fun m!391351 () Bool)

(assert (=> b!394714 m!391351))

(declare-fun m!391353 () Bool)

(assert (=> start!38246 m!391353))

(declare-fun m!391355 () Bool)

(assert (=> start!38246 m!391355))

(check-sat (not mapNonEmpty!16254) tp_is_empty!9769 (not b!394720) (not b!394714) (not start!38246))
(check-sat)
(get-model)

(declare-fun d!73321 () Bool)

(assert (=> d!73321 (= (array_inv!8258 _values!549) (bvsge (size!11525 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38246 d!73321))

(declare-fun d!73323 () Bool)

(assert (=> d!73323 (= (array_inv!8259 _keys!709) (bvsge (size!11526 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38246 d!73323))

(declare-fun b!394771 () Bool)

(declare-fun e!238997 () Bool)

(declare-fun e!238998 () Bool)

(assert (=> b!394771 (= e!238997 e!238998)))

(declare-fun c!54516 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394771 (= c!54516 (validKeyInArray!0 (select (arr!11174 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!394772 () Bool)

(declare-fun e!238996 () Bool)

(assert (=> b!394772 (= e!238998 e!238996)))

(declare-fun lt!187054 () (_ BitVec 64))

(assert (=> b!394772 (= lt!187054 (select (arr!11174 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12033 0))(
  ( (Unit!12034) )
))
(declare-fun lt!187053 () Unit!12033)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23436 (_ BitVec 64) (_ BitVec 32)) Unit!12033)

(assert (=> b!394772 (= lt!187053 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!187054 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!23436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394772 (arrayContainsKey!0 _keys!709 lt!187054 #b00000000000000000000000000000000)))

(declare-fun lt!187052 () Unit!12033)

(assert (=> b!394772 (= lt!187052 lt!187053)))

(declare-fun res!226310 () Bool)

(declare-datatypes ((SeekEntryResult!3469 0))(
  ( (MissingZero!3469 (index!16055 (_ BitVec 32))) (Found!3469 (index!16056 (_ BitVec 32))) (Intermediate!3469 (undefined!4281 Bool) (index!16057 (_ BitVec 32)) (x!38518 (_ BitVec 32))) (Undefined!3469) (MissingVacant!3469 (index!16058 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23436 (_ BitVec 32)) SeekEntryResult!3469)

(assert (=> b!394772 (= res!226310 (= (seekEntryOrOpen!0 (select (arr!11174 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3469 #b00000000000000000000000000000000)))))

(assert (=> b!394772 (=> (not res!226310) (not e!238996))))

(declare-fun b!394773 () Bool)

(declare-fun call!27850 () Bool)

(assert (=> b!394773 (= e!238996 call!27850)))

(declare-fun b!394774 () Bool)

(assert (=> b!394774 (= e!238998 call!27850)))

(declare-fun bm!27847 () Bool)

(assert (=> bm!27847 (= call!27850 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun d!73325 () Bool)

(declare-fun res!226309 () Bool)

(assert (=> d!73325 (=> res!226309 e!238997)))

(assert (=> d!73325 (= res!226309 (bvsge #b00000000000000000000000000000000 (size!11526 _keys!709)))))

(assert (=> d!73325 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!238997)))

(assert (= (and d!73325 (not res!226309)) b!394771))

(assert (= (and b!394771 c!54516) b!394772))

(assert (= (and b!394771 (not c!54516)) b!394774))

(assert (= (and b!394772 res!226310) b!394773))

(assert (= (or b!394773 b!394774) bm!27847))

(declare-fun m!391377 () Bool)

(assert (=> b!394771 m!391377))

(assert (=> b!394771 m!391377))

(declare-fun m!391379 () Bool)

(assert (=> b!394771 m!391379))

(assert (=> b!394772 m!391377))

(declare-fun m!391381 () Bool)

(assert (=> b!394772 m!391381))

(declare-fun m!391383 () Bool)

(assert (=> b!394772 m!391383))

(assert (=> b!394772 m!391377))

(declare-fun m!391385 () Bool)

(assert (=> b!394772 m!391385))

(declare-fun m!391387 () Bool)

(assert (=> bm!27847 m!391387))

(assert (=> b!394720 d!73325))

(declare-fun d!73327 () Bool)

(assert (=> d!73327 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!394714 d!73327))

(declare-fun b!394781 () Bool)

(declare-fun e!239003 () Bool)

(assert (=> b!394781 (= e!239003 tp_is_empty!9769)))

(declare-fun mapIsEmpty!16263 () Bool)

(declare-fun mapRes!16263 () Bool)

(assert (=> mapIsEmpty!16263 mapRes!16263))

(declare-fun b!394782 () Bool)

(declare-fun e!239004 () Bool)

(assert (=> b!394782 (= e!239004 tp_is_empty!9769)))

(declare-fun condMapEmpty!16263 () Bool)

(declare-fun mapDefault!16263 () ValueCell!4541)

(assert (=> mapNonEmpty!16254 (= condMapEmpty!16263 (= mapRest!16254 ((as const (Array (_ BitVec 32) ValueCell!4541)) mapDefault!16263)))))

(assert (=> mapNonEmpty!16254 (= tp!32049 (and e!239004 mapRes!16263))))

(declare-fun mapNonEmpty!16263 () Bool)

(declare-fun tp!32058 () Bool)

(assert (=> mapNonEmpty!16263 (= mapRes!16263 (and tp!32058 e!239003))))

(declare-fun mapKey!16263 () (_ BitVec 32))

(declare-fun mapValue!16263 () ValueCell!4541)

(declare-fun mapRest!16263 () (Array (_ BitVec 32) ValueCell!4541))

(assert (=> mapNonEmpty!16263 (= mapRest!16254 (store mapRest!16263 mapKey!16263 mapValue!16263))))

(assert (= (and mapNonEmpty!16254 condMapEmpty!16263) mapIsEmpty!16263))

(assert (= (and mapNonEmpty!16254 (not condMapEmpty!16263)) mapNonEmpty!16263))

(assert (= (and mapNonEmpty!16263 ((_ is ValueCellFull!4541) mapValue!16263)) b!394781))

(assert (= (and mapNonEmpty!16254 ((_ is ValueCellFull!4541) mapDefault!16263)) b!394782))

(declare-fun m!391389 () Bool)

(assert (=> mapNonEmpty!16263 m!391389))

(check-sat (not mapNonEmpty!16263) tp_is_empty!9769 (not b!394772) (not bm!27847) (not b!394771))
(check-sat)
