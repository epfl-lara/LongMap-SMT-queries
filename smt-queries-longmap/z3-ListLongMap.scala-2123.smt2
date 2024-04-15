; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35922 () Bool)

(assert start!35922)

(declare-fun res!200788 () Bool)

(declare-fun e!220957 () Bool)

(assert (=> start!35922 (=> (not res!200788) (not e!220957))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35922 (= res!200788 (validMask!0 mask!1943))))

(assert (=> start!35922 e!220957))

(assert (=> start!35922 true))

(declare-datatypes ((V!12123 0))(
  ( (V!12124 (val!4224 Int)) )
))
(declare-datatypes ((ValueCell!3836 0))(
  ( (ValueCellFull!3836 (v!6412 V!12123)) (EmptyCell!3836) )
))
(declare-datatypes ((array!20245 0))(
  ( (array!20246 (arr!9613 (Array (_ BitVec 32) ValueCell!3836)) (size!9966 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20245)

(declare-fun e!220958 () Bool)

(declare-fun array_inv!7082 (array!20245) Bool)

(assert (=> start!35922 (and (array_inv!7082 _values!1277) e!220958)))

(declare-datatypes ((array!20247 0))(
  ( (array!20248 (arr!9614 (Array (_ BitVec 32) (_ BitVec 64))) (size!9967 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20247)

(declare-fun array_inv!7083 (array!20247) Bool)

(assert (=> start!35922 (array_inv!7083 _keys!1541)))

(declare-fun mapIsEmpty!14055 () Bool)

(declare-fun mapRes!14055 () Bool)

(assert (=> mapIsEmpty!14055 mapRes!14055))

(declare-fun mapNonEmpty!14055 () Bool)

(declare-fun tp!28131 () Bool)

(declare-fun e!220961 () Bool)

(assert (=> mapNonEmpty!14055 (= mapRes!14055 (and tp!28131 e!220961))))

(declare-fun mapKey!14055 () (_ BitVec 32))

(declare-fun mapValue!14055 () ValueCell!3836)

(declare-fun mapRest!14055 () (Array (_ BitVec 32) ValueCell!3836))

(assert (=> mapNonEmpty!14055 (= (arr!9613 _values!1277) (store mapRest!14055 mapKey!14055 mapValue!14055))))

(declare-fun b!360896 () Bool)

(assert (=> b!360896 (= e!220957 (and (bvsle #b00000000000000000000000000000000 (size!9967 _keys!1541)) (bvsge (size!9967 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!360897 () Bool)

(declare-fun res!200790 () Bool)

(assert (=> b!360897 (=> (not res!200790) (not e!220957))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!360897 (= res!200790 (and (= (size!9966 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9967 _keys!1541) (size!9966 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!360898 () Bool)

(declare-fun tp_is_empty!8359 () Bool)

(assert (=> b!360898 (= e!220961 tp_is_empty!8359)))

(declare-fun b!360899 () Bool)

(declare-fun res!200789 () Bool)

(assert (=> b!360899 (=> (not res!200789) (not e!220957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20247 (_ BitVec 32)) Bool)

(assert (=> b!360899 (= res!200789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!360900 () Bool)

(declare-fun e!220959 () Bool)

(assert (=> b!360900 (= e!220958 (and e!220959 mapRes!14055))))

(declare-fun condMapEmpty!14055 () Bool)

(declare-fun mapDefault!14055 () ValueCell!3836)

(assert (=> b!360900 (= condMapEmpty!14055 (= (arr!9613 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3836)) mapDefault!14055)))))

(declare-fun b!360901 () Bool)

(assert (=> b!360901 (= e!220959 tp_is_empty!8359)))

(assert (= (and start!35922 res!200788) b!360897))

(assert (= (and b!360897 res!200790) b!360899))

(assert (= (and b!360899 res!200789) b!360896))

(assert (= (and b!360900 condMapEmpty!14055) mapIsEmpty!14055))

(assert (= (and b!360900 (not condMapEmpty!14055)) mapNonEmpty!14055))

(get-info :version)

(assert (= (and mapNonEmpty!14055 ((_ is ValueCellFull!3836) mapValue!14055)) b!360898))

(assert (= (and b!360900 ((_ is ValueCellFull!3836) mapDefault!14055)) b!360901))

(assert (= start!35922 b!360900))

(declare-fun m!357369 () Bool)

(assert (=> start!35922 m!357369))

(declare-fun m!357371 () Bool)

(assert (=> start!35922 m!357371))

(declare-fun m!357373 () Bool)

(assert (=> start!35922 m!357373))

(declare-fun m!357375 () Bool)

(assert (=> mapNonEmpty!14055 m!357375))

(declare-fun m!357377 () Bool)

(assert (=> b!360899 m!357377))

(check-sat (not start!35922) (not b!360899) (not mapNonEmpty!14055) tp_is_empty!8359)
(check-sat)
(get-model)

(declare-fun d!71693 () Bool)

(assert (=> d!71693 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35922 d!71693))

(declare-fun d!71695 () Bool)

(assert (=> d!71695 (= (array_inv!7082 _values!1277) (bvsge (size!9966 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35922 d!71695))

(declare-fun d!71697 () Bool)

(assert (=> d!71697 (= (array_inv!7083 _keys!1541) (bvsge (size!9967 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35922 d!71697))

(declare-fun b!360946 () Bool)

(declare-fun e!220999 () Bool)

(declare-fun e!220998 () Bool)

(assert (=> b!360946 (= e!220999 e!220998)))

(declare-fun c!53648 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360946 (= c!53648 (validKeyInArray!0 (select (arr!9614 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!360947 () Bool)

(declare-fun e!221000 () Bool)

(assert (=> b!360947 (= e!220998 e!221000)))

(declare-fun lt!166299 () (_ BitVec 64))

(assert (=> b!360947 (= lt!166299 (select (arr!9614 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11088 0))(
  ( (Unit!11089) )
))
(declare-fun lt!166298 () Unit!11088)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20247 (_ BitVec 64) (_ BitVec 32)) Unit!11088)

(assert (=> b!360947 (= lt!166298 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166299 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360947 (arrayContainsKey!0 _keys!1541 lt!166299 #b00000000000000000000000000000000)))

(declare-fun lt!166300 () Unit!11088)

(assert (=> b!360947 (= lt!166300 lt!166298)))

(declare-fun res!200814 () Bool)

(declare-datatypes ((SeekEntryResult!3488 0))(
  ( (MissingZero!3488 (index!16131 (_ BitVec 32))) (Found!3488 (index!16132 (_ BitVec 32))) (Intermediate!3488 (undefined!4300 Bool) (index!16133 (_ BitVec 32)) (x!35979 (_ BitVec 32))) (Undefined!3488) (MissingVacant!3488 (index!16134 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20247 (_ BitVec 32)) SeekEntryResult!3488)

(assert (=> b!360947 (= res!200814 (= (seekEntryOrOpen!0 (select (arr!9614 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3488 #b00000000000000000000000000000000)))))

(assert (=> b!360947 (=> (not res!200814) (not e!221000))))

(declare-fun b!360948 () Bool)

(declare-fun call!27146 () Bool)

(assert (=> b!360948 (= e!220998 call!27146)))

(declare-fun b!360949 () Bool)

(assert (=> b!360949 (= e!221000 call!27146)))

(declare-fun bm!27143 () Bool)

(assert (=> bm!27143 (= call!27146 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun d!71699 () Bool)

(declare-fun res!200813 () Bool)

(assert (=> d!71699 (=> res!200813 e!220999)))

(assert (=> d!71699 (= res!200813 (bvsge #b00000000000000000000000000000000 (size!9967 _keys!1541)))))

(assert (=> d!71699 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!220999)))

(assert (= (and d!71699 (not res!200813)) b!360946))

(assert (= (and b!360946 c!53648) b!360947))

(assert (= (and b!360946 (not c!53648)) b!360948))

(assert (= (and b!360947 res!200814) b!360949))

(assert (= (or b!360949 b!360948) bm!27143))

(declare-fun m!357399 () Bool)

(assert (=> b!360946 m!357399))

(assert (=> b!360946 m!357399))

(declare-fun m!357401 () Bool)

(assert (=> b!360946 m!357401))

(assert (=> b!360947 m!357399))

(declare-fun m!357403 () Bool)

(assert (=> b!360947 m!357403))

(declare-fun m!357405 () Bool)

(assert (=> b!360947 m!357405))

(assert (=> b!360947 m!357399))

(declare-fun m!357407 () Bool)

(assert (=> b!360947 m!357407))

(declare-fun m!357409 () Bool)

(assert (=> bm!27143 m!357409))

(assert (=> b!360899 d!71699))

(declare-fun condMapEmpty!14064 () Bool)

(declare-fun mapDefault!14064 () ValueCell!3836)

(assert (=> mapNonEmpty!14055 (= condMapEmpty!14064 (= mapRest!14055 ((as const (Array (_ BitVec 32) ValueCell!3836)) mapDefault!14064)))))

(declare-fun e!221006 () Bool)

(declare-fun mapRes!14064 () Bool)

(assert (=> mapNonEmpty!14055 (= tp!28131 (and e!221006 mapRes!14064))))

(declare-fun b!360956 () Bool)

(declare-fun e!221005 () Bool)

(assert (=> b!360956 (= e!221005 tp_is_empty!8359)))

(declare-fun b!360957 () Bool)

(assert (=> b!360957 (= e!221006 tp_is_empty!8359)))

(declare-fun mapIsEmpty!14064 () Bool)

(assert (=> mapIsEmpty!14064 mapRes!14064))

(declare-fun mapNonEmpty!14064 () Bool)

(declare-fun tp!28140 () Bool)

(assert (=> mapNonEmpty!14064 (= mapRes!14064 (and tp!28140 e!221005))))

(declare-fun mapValue!14064 () ValueCell!3836)

(declare-fun mapKey!14064 () (_ BitVec 32))

(declare-fun mapRest!14064 () (Array (_ BitVec 32) ValueCell!3836))

(assert (=> mapNonEmpty!14064 (= mapRest!14055 (store mapRest!14064 mapKey!14064 mapValue!14064))))

(assert (= (and mapNonEmpty!14055 condMapEmpty!14064) mapIsEmpty!14064))

(assert (= (and mapNonEmpty!14055 (not condMapEmpty!14064)) mapNonEmpty!14064))

(assert (= (and mapNonEmpty!14064 ((_ is ValueCellFull!3836) mapValue!14064)) b!360956))

(assert (= (and mapNonEmpty!14055 ((_ is ValueCellFull!3836) mapDefault!14064)) b!360957))

(declare-fun m!357411 () Bool)

(assert (=> mapNonEmpty!14064 m!357411))

(check-sat (not bm!27143) (not b!360946) (not b!360947) tp_is_empty!8359 (not mapNonEmpty!14064))
(check-sat)
