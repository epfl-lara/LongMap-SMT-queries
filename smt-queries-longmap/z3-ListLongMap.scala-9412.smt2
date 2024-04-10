; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112060 () Bool)

(assert start!112060)

(declare-fun b!1327504 () Bool)

(declare-fun e!756721 () Bool)

(declare-datatypes ((List!30692 0))(
  ( (Nil!30689) (Cons!30688 (h!31897 (_ BitVec 64)) (t!44698 List!30692)) )
))
(declare-fun noDuplicate!2065 (List!30692) Bool)

(assert (=> b!1327504 (= e!756721 (not (noDuplicate!2065 Nil!30689)))))

(declare-fun mapIsEmpty!56248 () Bool)

(declare-fun mapRes!56248 () Bool)

(assert (=> mapIsEmpty!56248 mapRes!56248))

(declare-fun b!1327505 () Bool)

(declare-fun e!756719 () Bool)

(declare-fun tp_is_empty!36387 () Bool)

(assert (=> b!1327505 (= e!756719 tp_is_empty!36387)))

(declare-fun res!880887 () Bool)

(assert (=> start!112060 (=> (not res!880887) (not e!756721))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112060 (= res!880887 (validMask!0 mask!1998))))

(assert (=> start!112060 e!756721))

(assert (=> start!112060 true))

(declare-datatypes ((V!53619 0))(
  ( (V!53620 (val!18268 Int)) )
))
(declare-datatypes ((ValueCell!17295 0))(
  ( (ValueCellFull!17295 (v!20904 V!53619)) (EmptyCell!17295) )
))
(declare-datatypes ((array!89682 0))(
  ( (array!89683 (arr!43309 (Array (_ BitVec 32) ValueCell!17295)) (size!43859 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89682)

(declare-fun e!756720 () Bool)

(declare-fun array_inv!32689 (array!89682) Bool)

(assert (=> start!112060 (and (array_inv!32689 _values!1320) e!756720)))

(declare-datatypes ((array!89684 0))(
  ( (array!89685 (arr!43310 (Array (_ BitVec 32) (_ BitVec 64))) (size!43860 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89684)

(declare-fun array_inv!32690 (array!89684) Bool)

(assert (=> start!112060 (array_inv!32690 _keys!1590)))

(declare-fun mapNonEmpty!56248 () Bool)

(declare-fun tp!107155 () Bool)

(assert (=> mapNonEmpty!56248 (= mapRes!56248 (and tp!107155 e!756719))))

(declare-fun mapKey!56248 () (_ BitVec 32))

(declare-fun mapValue!56248 () ValueCell!17295)

(declare-fun mapRest!56248 () (Array (_ BitVec 32) ValueCell!17295))

(assert (=> mapNonEmpty!56248 (= (arr!43309 _values!1320) (store mapRest!56248 mapKey!56248 mapValue!56248))))

(declare-fun b!1327506 () Bool)

(declare-fun e!756718 () Bool)

(assert (=> b!1327506 (= e!756718 tp_is_empty!36387)))

(declare-fun b!1327507 () Bool)

(assert (=> b!1327507 (= e!756720 (and e!756718 mapRes!56248))))

(declare-fun condMapEmpty!56248 () Bool)

(declare-fun mapDefault!56248 () ValueCell!17295)

(assert (=> b!1327507 (= condMapEmpty!56248 (= (arr!43309 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17295)) mapDefault!56248)))))

(declare-fun b!1327508 () Bool)

(declare-fun res!880885 () Bool)

(assert (=> b!1327508 (=> (not res!880885) (not e!756721))))

(assert (=> b!1327508 (= res!880885 (and (bvsle #b00000000000000000000000000000000 (size!43860 _keys!1590)) (bvslt (size!43860 _keys!1590) #b01111111111111111111111111111111)))))

(declare-fun b!1327509 () Bool)

(declare-fun res!880886 () Bool)

(assert (=> b!1327509 (=> (not res!880886) (not e!756721))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327509 (= res!880886 (and (= (size!43859 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43860 _keys!1590) (size!43859 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1327510 () Bool)

(declare-fun res!880888 () Bool)

(assert (=> b!1327510 (=> (not res!880888) (not e!756721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89684 (_ BitVec 32)) Bool)

(assert (=> b!1327510 (= res!880888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112060 res!880887) b!1327509))

(assert (= (and b!1327509 res!880886) b!1327510))

(assert (= (and b!1327510 res!880888) b!1327508))

(assert (= (and b!1327508 res!880885) b!1327504))

(assert (= (and b!1327507 condMapEmpty!56248) mapIsEmpty!56248))

(assert (= (and b!1327507 (not condMapEmpty!56248)) mapNonEmpty!56248))

(get-info :version)

(assert (= (and mapNonEmpty!56248 ((_ is ValueCellFull!17295) mapValue!56248)) b!1327505))

(assert (= (and b!1327507 ((_ is ValueCellFull!17295) mapDefault!56248)) b!1327506))

(assert (= start!112060 b!1327507))

(declare-fun m!1216799 () Bool)

(assert (=> b!1327504 m!1216799))

(declare-fun m!1216801 () Bool)

(assert (=> start!112060 m!1216801))

(declare-fun m!1216803 () Bool)

(assert (=> start!112060 m!1216803))

(declare-fun m!1216805 () Bool)

(assert (=> start!112060 m!1216805))

(declare-fun m!1216807 () Bool)

(assert (=> mapNonEmpty!56248 m!1216807))

(declare-fun m!1216809 () Bool)

(assert (=> b!1327510 m!1216809))

(check-sat (not mapNonEmpty!56248) (not b!1327510) tp_is_empty!36387 (not start!112060) (not b!1327504))
(check-sat)
(get-model)

(declare-fun d!143327 () Bool)

(assert (=> d!143327 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112060 d!143327))

(declare-fun d!143329 () Bool)

(assert (=> d!143329 (= (array_inv!32689 _values!1320) (bvsge (size!43859 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112060 d!143329))

(declare-fun d!143331 () Bool)

(assert (=> d!143331 (= (array_inv!32690 _keys!1590) (bvsge (size!43860 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112060 d!143331))

(declare-fun d!143333 () Bool)

(declare-fun res!880905 () Bool)

(declare-fun e!756742 () Bool)

(assert (=> d!143333 (=> res!880905 e!756742)))

(assert (=> d!143333 (= res!880905 ((_ is Nil!30689) Nil!30689))))

(assert (=> d!143333 (= (noDuplicate!2065 Nil!30689) e!756742)))

(declare-fun b!1327536 () Bool)

(declare-fun e!756743 () Bool)

(assert (=> b!1327536 (= e!756742 e!756743)))

(declare-fun res!880906 () Bool)

(assert (=> b!1327536 (=> (not res!880906) (not e!756743))))

(declare-fun contains!8783 (List!30692 (_ BitVec 64)) Bool)

(assert (=> b!1327536 (= res!880906 (not (contains!8783 (t!44698 Nil!30689) (h!31897 Nil!30689))))))

(declare-fun b!1327537 () Bool)

(assert (=> b!1327537 (= e!756743 (noDuplicate!2065 (t!44698 Nil!30689)))))

(assert (= (and d!143333 (not res!880905)) b!1327536))

(assert (= (and b!1327536 res!880906) b!1327537))

(declare-fun m!1216823 () Bool)

(assert (=> b!1327536 m!1216823))

(declare-fun m!1216825 () Bool)

(assert (=> b!1327537 m!1216825))

(assert (=> b!1327504 d!143333))

(declare-fun b!1327546 () Bool)

(declare-fun e!756751 () Bool)

(declare-fun call!64819 () Bool)

(assert (=> b!1327546 (= e!756751 call!64819)))

(declare-fun d!143335 () Bool)

(declare-fun res!880912 () Bool)

(declare-fun e!756752 () Bool)

(assert (=> d!143335 (=> res!880912 e!756752)))

(assert (=> d!143335 (= res!880912 (bvsge #b00000000000000000000000000000000 (size!43860 _keys!1590)))))

(assert (=> d!143335 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!756752)))

(declare-fun b!1327547 () Bool)

(declare-fun e!756750 () Bool)

(assert (=> b!1327547 (= e!756750 call!64819)))

(declare-fun b!1327548 () Bool)

(assert (=> b!1327548 (= e!756752 e!756750)))

(declare-fun c!125898 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1327548 (= c!125898 (validKeyInArray!0 (select (arr!43310 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun bm!64816 () Bool)

(assert (=> bm!64816 (= call!64819 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1327549 () Bool)

(assert (=> b!1327549 (= e!756750 e!756751)))

(declare-fun lt!590719 () (_ BitVec 64))

(assert (=> b!1327549 (= lt!590719 (select (arr!43310 _keys!1590) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43735 0))(
  ( (Unit!43736) )
))
(declare-fun lt!590720 () Unit!43735)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89684 (_ BitVec 64) (_ BitVec 32)) Unit!43735)

(assert (=> b!1327549 (= lt!590720 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!590719 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1327549 (arrayContainsKey!0 _keys!1590 lt!590719 #b00000000000000000000000000000000)))

(declare-fun lt!590721 () Unit!43735)

(assert (=> b!1327549 (= lt!590721 lt!590720)))

(declare-fun res!880911 () Bool)

(declare-datatypes ((SeekEntryResult!10045 0))(
  ( (MissingZero!10045 (index!42551 (_ BitVec 32))) (Found!10045 (index!42552 (_ BitVec 32))) (Intermediate!10045 (undefined!10857 Bool) (index!42553 (_ BitVec 32)) (x!118367 (_ BitVec 32))) (Undefined!10045) (MissingVacant!10045 (index!42554 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89684 (_ BitVec 32)) SeekEntryResult!10045)

(assert (=> b!1327549 (= res!880911 (= (seekEntryOrOpen!0 (select (arr!43310 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10045 #b00000000000000000000000000000000)))))

(assert (=> b!1327549 (=> (not res!880911) (not e!756751))))

(assert (= (and d!143335 (not res!880912)) b!1327548))

(assert (= (and b!1327548 c!125898) b!1327549))

(assert (= (and b!1327548 (not c!125898)) b!1327547))

(assert (= (and b!1327549 res!880911) b!1327546))

(assert (= (or b!1327546 b!1327547) bm!64816))

(declare-fun m!1216827 () Bool)

(assert (=> b!1327548 m!1216827))

(assert (=> b!1327548 m!1216827))

(declare-fun m!1216829 () Bool)

(assert (=> b!1327548 m!1216829))

(declare-fun m!1216831 () Bool)

(assert (=> bm!64816 m!1216831))

(assert (=> b!1327549 m!1216827))

(declare-fun m!1216833 () Bool)

(assert (=> b!1327549 m!1216833))

(declare-fun m!1216835 () Bool)

(assert (=> b!1327549 m!1216835))

(assert (=> b!1327549 m!1216827))

(declare-fun m!1216837 () Bool)

(assert (=> b!1327549 m!1216837))

(assert (=> b!1327510 d!143335))

(declare-fun b!1327557 () Bool)

(declare-fun e!756757 () Bool)

(assert (=> b!1327557 (= e!756757 tp_is_empty!36387)))

(declare-fun b!1327556 () Bool)

(declare-fun e!756758 () Bool)

(assert (=> b!1327556 (= e!756758 tp_is_empty!36387)))

(declare-fun condMapEmpty!56254 () Bool)

(declare-fun mapDefault!56254 () ValueCell!17295)

(assert (=> mapNonEmpty!56248 (= condMapEmpty!56254 (= mapRest!56248 ((as const (Array (_ BitVec 32) ValueCell!17295)) mapDefault!56254)))))

(declare-fun mapRes!56254 () Bool)

(assert (=> mapNonEmpty!56248 (= tp!107155 (and e!756757 mapRes!56254))))

(declare-fun mapIsEmpty!56254 () Bool)

(assert (=> mapIsEmpty!56254 mapRes!56254))

(declare-fun mapNonEmpty!56254 () Bool)

(declare-fun tp!107161 () Bool)

(assert (=> mapNonEmpty!56254 (= mapRes!56254 (and tp!107161 e!756758))))

(declare-fun mapValue!56254 () ValueCell!17295)

(declare-fun mapKey!56254 () (_ BitVec 32))

(declare-fun mapRest!56254 () (Array (_ BitVec 32) ValueCell!17295))

(assert (=> mapNonEmpty!56254 (= mapRest!56248 (store mapRest!56254 mapKey!56254 mapValue!56254))))

(assert (= (and mapNonEmpty!56248 condMapEmpty!56254) mapIsEmpty!56254))

(assert (= (and mapNonEmpty!56248 (not condMapEmpty!56254)) mapNonEmpty!56254))

(assert (= (and mapNonEmpty!56254 ((_ is ValueCellFull!17295) mapValue!56254)) b!1327556))

(assert (= (and mapNonEmpty!56248 ((_ is ValueCellFull!17295) mapDefault!56254)) b!1327557))

(declare-fun m!1216839 () Bool)

(assert (=> mapNonEmpty!56254 m!1216839))

(check-sat tp_is_empty!36387 (not b!1327536) (not b!1327537) (not bm!64816) (not mapNonEmpty!56254) (not b!1327549) (not b!1327548))
(check-sat)
