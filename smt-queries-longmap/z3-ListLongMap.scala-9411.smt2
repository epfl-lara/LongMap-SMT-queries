; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112268 () Bool)

(assert start!112268)

(declare-fun b!1328706 () Bool)

(declare-fun e!757486 () Bool)

(declare-fun tp_is_empty!36379 () Bool)

(assert (=> b!1328706 (= e!757486 tp_is_empty!36379)))

(declare-fun b!1328707 () Bool)

(declare-fun e!757489 () Bool)

(declare-datatypes ((array!89763 0))(
  ( (array!89764 (arr!43346 (Array (_ BitVec 32) (_ BitVec 64))) (size!43897 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89763)

(assert (=> b!1328707 (= e!757489 (and (bvsle #b00000000000000000000000000000000 (size!43897 _keys!1590)) (bvsge (size!43897 _keys!1590) #b01111111111111111111111111111111)))))

(declare-fun b!1328708 () Bool)

(declare-fun res!881356 () Bool)

(assert (=> b!1328708 (=> (not res!881356) (not e!757489))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89763 (_ BitVec 32)) Bool)

(assert (=> b!1328708 (= res!881356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56233 () Bool)

(declare-fun mapRes!56233 () Bool)

(declare-fun tp!107140 () Bool)

(declare-fun e!757490 () Bool)

(assert (=> mapNonEmpty!56233 (= mapRes!56233 (and tp!107140 e!757490))))

(declare-datatypes ((V!53609 0))(
  ( (V!53610 (val!18264 Int)) )
))
(declare-datatypes ((ValueCell!17291 0))(
  ( (ValueCellFull!17291 (v!20895 V!53609)) (EmptyCell!17291) )
))
(declare-datatypes ((array!89765 0))(
  ( (array!89766 (arr!43347 (Array (_ BitVec 32) ValueCell!17291)) (size!43898 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89765)

(declare-fun mapValue!56233 () ValueCell!17291)

(declare-fun mapRest!56233 () (Array (_ BitVec 32) ValueCell!17291))

(declare-fun mapKey!56233 () (_ BitVec 32))

(assert (=> mapNonEmpty!56233 (= (arr!43347 _values!1320) (store mapRest!56233 mapKey!56233 mapValue!56233))))

(declare-fun b!1328709 () Bool)

(declare-fun res!881358 () Bool)

(assert (=> b!1328709 (=> (not res!881358) (not e!757489))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1328709 (= res!881358 (and (= (size!43898 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43897 _keys!1590) (size!43898 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328710 () Bool)

(declare-fun e!757487 () Bool)

(assert (=> b!1328710 (= e!757487 (and e!757486 mapRes!56233))))

(declare-fun condMapEmpty!56233 () Bool)

(declare-fun mapDefault!56233 () ValueCell!17291)

(assert (=> b!1328710 (= condMapEmpty!56233 (= (arr!43347 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17291)) mapDefault!56233)))))

(declare-fun res!881357 () Bool)

(assert (=> start!112268 (=> (not res!881357) (not e!757489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112268 (= res!881357 (validMask!0 mask!1998))))

(assert (=> start!112268 e!757489))

(assert (=> start!112268 true))

(declare-fun array_inv!32977 (array!89765) Bool)

(assert (=> start!112268 (and (array_inv!32977 _values!1320) e!757487)))

(declare-fun array_inv!32978 (array!89763) Bool)

(assert (=> start!112268 (array_inv!32978 _keys!1590)))

(declare-fun b!1328711 () Bool)

(assert (=> b!1328711 (= e!757490 tp_is_empty!36379)))

(declare-fun mapIsEmpty!56233 () Bool)

(assert (=> mapIsEmpty!56233 mapRes!56233))

(assert (= (and start!112268 res!881357) b!1328709))

(assert (= (and b!1328709 res!881358) b!1328708))

(assert (= (and b!1328708 res!881356) b!1328707))

(assert (= (and b!1328710 condMapEmpty!56233) mapIsEmpty!56233))

(assert (= (and b!1328710 (not condMapEmpty!56233)) mapNonEmpty!56233))

(get-info :version)

(assert (= (and mapNonEmpty!56233 ((_ is ValueCellFull!17291) mapValue!56233)) b!1328711))

(assert (= (and b!1328710 ((_ is ValueCellFull!17291) mapDefault!56233)) b!1328706))

(assert (= start!112268 b!1328710))

(declare-fun m!1218341 () Bool)

(assert (=> b!1328708 m!1218341))

(declare-fun m!1218343 () Bool)

(assert (=> mapNonEmpty!56233 m!1218343))

(declare-fun m!1218345 () Bool)

(assert (=> start!112268 m!1218345))

(declare-fun m!1218347 () Bool)

(assert (=> start!112268 m!1218347))

(declare-fun m!1218349 () Bool)

(assert (=> start!112268 m!1218349))

(check-sat (not b!1328708) (not start!112268) (not mapNonEmpty!56233) tp_is_empty!36379)
(check-sat)
(get-model)

(declare-fun b!1328756 () Bool)

(declare-fun e!757529 () Bool)

(declare-fun call!64881 () Bool)

(assert (=> b!1328756 (= e!757529 call!64881)))

(declare-fun b!1328757 () Bool)

(declare-fun e!757527 () Bool)

(assert (=> b!1328757 (= e!757527 call!64881)))

(declare-fun bm!64878 () Bool)

(assert (=> bm!64878 (= call!64881 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1328758 () Bool)

(declare-fun e!757528 () Bool)

(assert (=> b!1328758 (= e!757528 e!757527)))

(declare-fun c!126293 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1328758 (= c!126293 (validKeyInArray!0 (select (arr!43346 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun d!143761 () Bool)

(declare-fun res!881382 () Bool)

(assert (=> d!143761 (=> res!881382 e!757528)))

(assert (=> d!143761 (= res!881382 (bvsge #b00000000000000000000000000000000 (size!43897 _keys!1590)))))

(assert (=> d!143761 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!757528)))

(declare-fun b!1328759 () Bool)

(assert (=> b!1328759 (= e!757527 e!757529)))

(declare-fun lt!591187 () (_ BitVec 64))

(assert (=> b!1328759 (= lt!591187 (select (arr!43346 _keys!1590) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43676 0))(
  ( (Unit!43677) )
))
(declare-fun lt!591188 () Unit!43676)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89763 (_ BitVec 64) (_ BitVec 32)) Unit!43676)

(assert (=> b!1328759 (= lt!591188 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!591187 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1328759 (arrayContainsKey!0 _keys!1590 lt!591187 #b00000000000000000000000000000000)))

(declare-fun lt!591186 () Unit!43676)

(assert (=> b!1328759 (= lt!591186 lt!591188)))

(declare-fun res!881381 () Bool)

(declare-datatypes ((SeekEntryResult!10000 0))(
  ( (MissingZero!10000 (index!42371 (_ BitVec 32))) (Found!10000 (index!42372 (_ BitVec 32))) (Intermediate!10000 (undefined!10812 Bool) (index!42373 (_ BitVec 32)) (x!118334 (_ BitVec 32))) (Undefined!10000) (MissingVacant!10000 (index!42374 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89763 (_ BitVec 32)) SeekEntryResult!10000)

(assert (=> b!1328759 (= res!881381 (= (seekEntryOrOpen!0 (select (arr!43346 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10000 #b00000000000000000000000000000000)))))

(assert (=> b!1328759 (=> (not res!881381) (not e!757529))))

(assert (= (and d!143761 (not res!881382)) b!1328758))

(assert (= (and b!1328758 c!126293) b!1328759))

(assert (= (and b!1328758 (not c!126293)) b!1328757))

(assert (= (and b!1328759 res!881381) b!1328756))

(assert (= (or b!1328756 b!1328757) bm!64878))

(declare-fun m!1218371 () Bool)

(assert (=> bm!64878 m!1218371))

(declare-fun m!1218373 () Bool)

(assert (=> b!1328758 m!1218373))

(assert (=> b!1328758 m!1218373))

(declare-fun m!1218375 () Bool)

(assert (=> b!1328758 m!1218375))

(assert (=> b!1328759 m!1218373))

(declare-fun m!1218377 () Bool)

(assert (=> b!1328759 m!1218377))

(declare-fun m!1218379 () Bool)

(assert (=> b!1328759 m!1218379))

(assert (=> b!1328759 m!1218373))

(declare-fun m!1218381 () Bool)

(assert (=> b!1328759 m!1218381))

(assert (=> b!1328708 d!143761))

(declare-fun d!143763 () Bool)

(assert (=> d!143763 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112268 d!143763))

(declare-fun d!143765 () Bool)

(assert (=> d!143765 (= (array_inv!32977 _values!1320) (bvsge (size!43898 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112268 d!143765))

(declare-fun d!143767 () Bool)

(assert (=> d!143767 (= (array_inv!32978 _keys!1590) (bvsge (size!43897 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112268 d!143767))

(declare-fun b!1328766 () Bool)

(declare-fun e!757534 () Bool)

(assert (=> b!1328766 (= e!757534 tp_is_empty!36379)))

(declare-fun b!1328767 () Bool)

(declare-fun e!757535 () Bool)

(assert (=> b!1328767 (= e!757535 tp_is_empty!36379)))

(declare-fun mapIsEmpty!56242 () Bool)

(declare-fun mapRes!56242 () Bool)

(assert (=> mapIsEmpty!56242 mapRes!56242))

(declare-fun mapNonEmpty!56242 () Bool)

(declare-fun tp!107149 () Bool)

(assert (=> mapNonEmpty!56242 (= mapRes!56242 (and tp!107149 e!757534))))

(declare-fun mapValue!56242 () ValueCell!17291)

(declare-fun mapRest!56242 () (Array (_ BitVec 32) ValueCell!17291))

(declare-fun mapKey!56242 () (_ BitVec 32))

(assert (=> mapNonEmpty!56242 (= mapRest!56233 (store mapRest!56242 mapKey!56242 mapValue!56242))))

(declare-fun condMapEmpty!56242 () Bool)

(declare-fun mapDefault!56242 () ValueCell!17291)

(assert (=> mapNonEmpty!56233 (= condMapEmpty!56242 (= mapRest!56233 ((as const (Array (_ BitVec 32) ValueCell!17291)) mapDefault!56242)))))

(assert (=> mapNonEmpty!56233 (= tp!107140 (and e!757535 mapRes!56242))))

(assert (= (and mapNonEmpty!56233 condMapEmpty!56242) mapIsEmpty!56242))

(assert (= (and mapNonEmpty!56233 (not condMapEmpty!56242)) mapNonEmpty!56242))

(assert (= (and mapNonEmpty!56242 ((_ is ValueCellFull!17291) mapValue!56242)) b!1328766))

(assert (= (and mapNonEmpty!56233 ((_ is ValueCellFull!17291) mapDefault!56242)) b!1328767))

(declare-fun m!1218383 () Bool)

(assert (=> mapNonEmpty!56242 m!1218383))

(check-sat (not mapNonEmpty!56242) (not b!1328758) tp_is_empty!36379 (not b!1328759) (not bm!64878))
(check-sat)
