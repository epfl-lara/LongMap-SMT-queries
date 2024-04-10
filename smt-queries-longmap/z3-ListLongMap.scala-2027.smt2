; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35290 () Bool)

(assert start!35290)

(declare-fun b!353605 () Bool)

(declare-fun e!216583 () Bool)

(declare-fun tp_is_empty!7785 () Bool)

(assert (=> b!353605 (= e!216583 tp_is_empty!7785)))

(declare-fun b!353606 () Bool)

(declare-fun e!216581 () Bool)

(declare-fun mapRes!13173 () Bool)

(assert (=> b!353606 (= e!216581 (and e!216583 mapRes!13173))))

(declare-fun condMapEmpty!13173 () Bool)

(declare-datatypes ((V!11357 0))(
  ( (V!11358 (val!3937 Int)) )
))
(declare-datatypes ((ValueCell!3549 0))(
  ( (ValueCellFull!3549 (v!6130 V!11357)) (EmptyCell!3549) )
))
(declare-datatypes ((array!19159 0))(
  ( (array!19160 (arr!9077 (Array (_ BitVec 32) ValueCell!3549)) (size!9429 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19159)

(declare-fun mapDefault!13173 () ValueCell!3549)

(assert (=> b!353606 (= condMapEmpty!13173 (= (arr!9077 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3549)) mapDefault!13173)))))

(declare-fun res!196039 () Bool)

(declare-fun e!216584 () Bool)

(assert (=> start!35290 (=> (not res!196039) (not e!216584))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35290 (= res!196039 (validMask!0 mask!1842))))

(assert (=> start!35290 e!216584))

(assert (=> start!35290 true))

(declare-fun array_inv!6688 (array!19159) Bool)

(assert (=> start!35290 (and (array_inv!6688 _values!1208) e!216581)))

(declare-datatypes ((array!19161 0))(
  ( (array!19162 (arr!9078 (Array (_ BitVec 32) (_ BitVec 64))) (size!9430 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19161)

(declare-fun array_inv!6689 (array!19161) Bool)

(assert (=> start!35290 (array_inv!6689 _keys!1456)))

(declare-fun mapNonEmpty!13173 () Bool)

(declare-fun tp!27069 () Bool)

(declare-fun e!216582 () Bool)

(assert (=> mapNonEmpty!13173 (= mapRes!13173 (and tp!27069 e!216582))))

(declare-fun mapValue!13173 () ValueCell!3549)

(declare-fun mapRest!13173 () (Array (_ BitVec 32) ValueCell!3549))

(declare-fun mapKey!13173 () (_ BitVec 32))

(assert (=> mapNonEmpty!13173 (= (arr!9077 _values!1208) (store mapRest!13173 mapKey!13173 mapValue!13173))))

(declare-fun b!353607 () Bool)

(declare-fun res!196040 () Bool)

(assert (=> b!353607 (=> (not res!196040) (not e!216584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19161 (_ BitVec 32)) Bool)

(assert (=> b!353607 (= res!196040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13173 () Bool)

(assert (=> mapIsEmpty!13173 mapRes!13173))

(declare-fun b!353608 () Bool)

(assert (=> b!353608 (= e!216584 (and (bvsle #b00000000000000000000000000000000 (size!9430 _keys!1456)) (bvsge (size!9430 _keys!1456) #b01111111111111111111111111111111)))))

(declare-fun b!353609 () Bool)

(declare-fun res!196038 () Bool)

(assert (=> b!353609 (=> (not res!196038) (not e!216584))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353609 (= res!196038 (and (= (size!9429 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9430 _keys!1456) (size!9429 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353610 () Bool)

(assert (=> b!353610 (= e!216582 tp_is_empty!7785)))

(assert (= (and start!35290 res!196039) b!353609))

(assert (= (and b!353609 res!196038) b!353607))

(assert (= (and b!353607 res!196040) b!353608))

(assert (= (and b!353606 condMapEmpty!13173) mapIsEmpty!13173))

(assert (= (and b!353606 (not condMapEmpty!13173)) mapNonEmpty!13173))

(get-info :version)

(assert (= (and mapNonEmpty!13173 ((_ is ValueCellFull!3549) mapValue!13173)) b!353610))

(assert (= (and b!353606 ((_ is ValueCellFull!3549) mapDefault!13173)) b!353605))

(assert (= start!35290 b!353606))

(declare-fun m!352919 () Bool)

(assert (=> start!35290 m!352919))

(declare-fun m!352921 () Bool)

(assert (=> start!35290 m!352921))

(declare-fun m!352923 () Bool)

(assert (=> start!35290 m!352923))

(declare-fun m!352925 () Bool)

(assert (=> mapNonEmpty!13173 m!352925))

(declare-fun m!352927 () Bool)

(assert (=> b!353607 m!352927))

(check-sat (not start!35290) (not b!353607) (not mapNonEmpty!13173) tp_is_empty!7785)
(check-sat)
(get-model)

(declare-fun d!71631 () Bool)

(assert (=> d!71631 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35290 d!71631))

(declare-fun d!71633 () Bool)

(assert (=> d!71633 (= (array_inv!6688 _values!1208) (bvsge (size!9429 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35290 d!71633))

(declare-fun d!71635 () Bool)

(assert (=> d!71635 (= (array_inv!6689 _keys!1456) (bvsge (size!9430 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35290 d!71635))

(declare-fun b!353637 () Bool)

(declare-fun e!216609 () Bool)

(declare-fun e!216607 () Bool)

(assert (=> b!353637 (= e!216609 e!216607)))

(declare-fun c!53697 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353637 (= c!53697 (validKeyInArray!0 (select (arr!9078 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!353639 () Bool)

(declare-fun call!27148 () Bool)

(assert (=> b!353639 (= e!216607 call!27148)))

(declare-fun b!353640 () Bool)

(declare-fun e!216608 () Bool)

(assert (=> b!353640 (= e!216607 e!216608)))

(declare-fun lt!165591 () (_ BitVec 64))

(assert (=> b!353640 (= lt!165591 (select (arr!9078 _keys!1456) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10918 0))(
  ( (Unit!10919) )
))
(declare-fun lt!165592 () Unit!10918)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19161 (_ BitVec 64) (_ BitVec 32)) Unit!10918)

(assert (=> b!353640 (= lt!165592 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!165591 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353640 (arrayContainsKey!0 _keys!1456 lt!165591 #b00000000000000000000000000000000)))

(declare-fun lt!165590 () Unit!10918)

(assert (=> b!353640 (= lt!165590 lt!165592)))

(declare-fun res!196055 () Bool)

(declare-datatypes ((SeekEntryResult!3487 0))(
  ( (MissingZero!3487 (index!16127 (_ BitVec 32))) (Found!3487 (index!16128 (_ BitVec 32))) (Intermediate!3487 (undefined!4299 Bool) (index!16129 (_ BitVec 32)) (x!35201 (_ BitVec 32))) (Undefined!3487) (MissingVacant!3487 (index!16130 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19161 (_ BitVec 32)) SeekEntryResult!3487)

(assert (=> b!353640 (= res!196055 (= (seekEntryOrOpen!0 (select (arr!9078 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3487 #b00000000000000000000000000000000)))))

(assert (=> b!353640 (=> (not res!196055) (not e!216608))))

(declare-fun bm!27145 () Bool)

(assert (=> bm!27145 (= call!27148 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(declare-fun d!71637 () Bool)

(declare-fun res!196054 () Bool)

(assert (=> d!71637 (=> res!196054 e!216609)))

(assert (=> d!71637 (= res!196054 (bvsge #b00000000000000000000000000000000 (size!9430 _keys!1456)))))

(assert (=> d!71637 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!216609)))

(declare-fun b!353638 () Bool)

(assert (=> b!353638 (= e!216608 call!27148)))

(assert (= (and d!71637 (not res!196054)) b!353637))

(assert (= (and b!353637 c!53697) b!353640))

(assert (= (and b!353637 (not c!53697)) b!353639))

(assert (= (and b!353640 res!196055) b!353638))

(assert (= (or b!353638 b!353639) bm!27145))

(declare-fun m!352939 () Bool)

(assert (=> b!353637 m!352939))

(assert (=> b!353637 m!352939))

(declare-fun m!352941 () Bool)

(assert (=> b!353637 m!352941))

(assert (=> b!353640 m!352939))

(declare-fun m!352943 () Bool)

(assert (=> b!353640 m!352943))

(declare-fun m!352945 () Bool)

(assert (=> b!353640 m!352945))

(assert (=> b!353640 m!352939))

(declare-fun m!352947 () Bool)

(assert (=> b!353640 m!352947))

(declare-fun m!352949 () Bool)

(assert (=> bm!27145 m!352949))

(assert (=> b!353607 d!71637))

(declare-fun condMapEmpty!13179 () Bool)

(declare-fun mapDefault!13179 () ValueCell!3549)

(assert (=> mapNonEmpty!13173 (= condMapEmpty!13179 (= mapRest!13173 ((as const (Array (_ BitVec 32) ValueCell!3549)) mapDefault!13179)))))

(declare-fun e!216615 () Bool)

(declare-fun mapRes!13179 () Bool)

(assert (=> mapNonEmpty!13173 (= tp!27069 (and e!216615 mapRes!13179))))

(declare-fun mapIsEmpty!13179 () Bool)

(assert (=> mapIsEmpty!13179 mapRes!13179))

(declare-fun b!353647 () Bool)

(declare-fun e!216614 () Bool)

(assert (=> b!353647 (= e!216614 tp_is_empty!7785)))

(declare-fun mapNonEmpty!13179 () Bool)

(declare-fun tp!27075 () Bool)

(assert (=> mapNonEmpty!13179 (= mapRes!13179 (and tp!27075 e!216614))))

(declare-fun mapValue!13179 () ValueCell!3549)

(declare-fun mapKey!13179 () (_ BitVec 32))

(declare-fun mapRest!13179 () (Array (_ BitVec 32) ValueCell!3549))

(assert (=> mapNonEmpty!13179 (= mapRest!13173 (store mapRest!13179 mapKey!13179 mapValue!13179))))

(declare-fun b!353648 () Bool)

(assert (=> b!353648 (= e!216615 tp_is_empty!7785)))

(assert (= (and mapNonEmpty!13173 condMapEmpty!13179) mapIsEmpty!13179))

(assert (= (and mapNonEmpty!13173 (not condMapEmpty!13179)) mapNonEmpty!13179))

(assert (= (and mapNonEmpty!13179 ((_ is ValueCellFull!3549) mapValue!13179)) b!353647))

(assert (= (and mapNonEmpty!13173 ((_ is ValueCellFull!3549) mapDefault!13179)) b!353648))

(declare-fun m!352951 () Bool)

(assert (=> mapNonEmpty!13179 m!352951))

(check-sat (not b!353637) (not bm!27145) tp_is_empty!7785 (not b!353640) (not mapNonEmpty!13179))
(check-sat)
